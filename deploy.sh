#!/bin/sh
clear
source config.shlib;
START=$(date +%s)

LB_NAME="$(config_get LB_NAME)"
SSH_USER="$(config_get SSH_USER)"
SSH_OPTIONS="$(config_get SSH_OPTIONS)"
PATH_REMOTE_CODE="$(config_get PATH_REMOTE_CODE)"
COMMAND="$(config_get COMMAND)"

LB=$(aws elb describe-load-balancers --load-balancer-name $LB_NAME)
INSTANCES_STR=$(echo $LB | jq ".LoadBalancerDescriptions[].Instances[].InstanceId" | tr -d '"')

for instance in $INSTANCES_STR
do
  INSTANCE_PUBLIC_DNS=$(aws ec2 describe-instances --instance-ids $instance | jq ".Reservations[].Instances[].PublicDnsName" | tr -d '"')
  echo "Connecting to $INSTANCE_PUBLIC_DNS $SSH_OPTIONS..."
  ssh -i $SSH_OPTIONS $SSH_USER@$INSTANCE_PUBLIC_DNS << ENDSSH
    $COMMAND
ENDSSH
done

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "==========================COMPLETED in $DIFF seconds"
