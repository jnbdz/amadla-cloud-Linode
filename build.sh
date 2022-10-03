#!/bin/sh

. ${BASE_PATH}/creds.sh

linode() {	
	linode_creds
	#export LINODE_API_TOKEN=$(cat ${BASE_PATH}/.secrets)
	#ls -la /home
	#ls -ls /home/ansible
	packer build ${BASE_PATH}/linode.base.pkr.hcl
}
linode
