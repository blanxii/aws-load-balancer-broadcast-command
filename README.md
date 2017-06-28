# 🗑️💩🗑️ AWS load balancer code deploy

## Requirements

* [AWS-CLI](https://aws.amazon.com/es/cli/)
* [AWS configuration](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
* [JQ](https://stedolan.github.io/jq/download/) (used to parse JSON)


## Configuration

Replace the following in the command:

* `LoadBalancerName` in the script with your LB.
* `SERVER_PATH='/<path-to-your-code>'` with the path you want to navigate
* `default-user-of-your-instance` with your user to connect to your instance like `ubuntu`
* `git pull origin master` with your own deploy script system.


You can use this script to broadcast a command to your LB instances.

Keep in mind you can create AMI after deploy using http://docs.aws.amazon.com/cli/latest/reference/ec2/create-image.html


## License
This project is released under the [WTFPL LICENSE](http://www.wtfpl.net/ "WTFPL LICENSE").
