#!/bin/sh
START=$(date +%s)

LB=$(aws elb describe-load-balancers --load-balancer-name LoadBalancerName)
INSTANCES_STR=$(echo $LB | jq ".LoadBalancerDescriptions[].Instances[].InstanceId" | tr -d '"')

SERVER_PATH='/<path-to-your-code>'

for instance in $INSTANCES_STR
do

  INSTANCE_PUBLIC_DNS=$(aws ec2 describe-instances --instance-ids $instance | jq ".Reservations[].Instances[].PublicDnsName" | tr -d '"')
  echo "Connecting to $INSTANCE_PUBLIC_DNS..."
  ssh -i <default-user-of-your-instance>@$INSTANCE_PUBLIC_DNS << ENDSSH
    cd $SERVER_PATH
    git pull origin master #feel free to replace it

ENDSSH
done

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "==========================COMPLETED in $DIFF seconds"
