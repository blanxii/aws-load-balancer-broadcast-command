# 🗑️💩🗑️ AWS load balancer broadcast command

## Requirements

* [AWS-CLI](https://aws.amazon.com/es/cli/)
* [AWS configuration](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
* [JQ](https://stedolan.github.io/jq/download/) (used to parse JSON)


## Configuration

Remember you should give permission to launch.sh file like `chmod 777 launch.sh`

Create `config.cfg` file and add your variables on it.

* `LB_NAME` with your LB.
* `PATH_REMOTE_CODE` with the path you want to navigate
* `SSH_USER` with your user to connect to your instance like `ubuntu`
* `SSH_OPTIONS` if you need to set custom variables like .pem file
* `COMMAND` command you want to execute. For instance `git pull origin master`


You can use this script to broadcast a command to your LB instances.

Keep in mind you can create AMI after that using http://docs.aws.amazon.com/cli/latest/reference/ec2/create-image.html


## License
This project is released under the [WTFPL LICENSE](http://www.wtfpl.net/ "WTFPL LICENSE").
