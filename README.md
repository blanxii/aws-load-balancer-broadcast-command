# 🗑️💩🗑️ AWS load balancer code deploy

## Requirements

* [AWS-CLI](https://aws.amazon.com/es/cli/)
* [AWS configuration](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
* [JQ](https://stedolan.github.io/jq/download/) (used to parse JSON)


## Configuration

Remember you should give permission to deploy.sh file like `chmod 777 deploy.sh`

Create `config.cfg` file and add your variables on it.

* `LB_NAME` with your LB.
* `PATH_REMOTE_CODE` with the path you want to navigate
* `SSH_USER` with your user to connect to your instance like `ubuntu`
* `SSH_OPTIONS` if you need to set custom variables like .pem file
* `COMMAND` with your own deploy script system like `git pull origin master`


You can use this script to broadcast a command to your LB instances.

Keep in mind you can create AMI after deploy using http://docs.aws.amazon.com/cli/latest/reference/ec2/create-image.html


## License
This project is released under the [WTFPL LICENSE](http://www.wtfpl.net/ "WTFPL LICENSE").
