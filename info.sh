#!/bin/sh

. ${BASE_PATH}/creds.sh

linode_info() {
	linode_creds

	# Setup HTTP header
	local api_header="-H \"Authorization: Bearer ${LINODE_API_TOKEN}\" -H \"Content-type: application/json\""

	local base_images_list=$(curl -s https://api.linode.com/v4/images)
	local private_images=$(curl -s  https://api.linode.com/v4/images | jq '.data | .[] | select(.id|test("^private."))')
	local list_instances=$(curl -s -H "Authorization: Bearer ${LINODE_API_TOKEN}" -H "Content-type: application/json" https://api.linode.com/v4/linode/instances)
	local count_instances=$(echo ${list_instances} | jq '.results')
	local instances=$(echo ${list_instances} | jq '.data | .[] | {"label": .label, "status": .status}')

	# What was already paid
	local payments=$(curl -s -H "Authorization: Bearer ${LINODE_API_TOKEN}" -H "Content-type: application/json" https://api.linode.com/v4/account/payments)

	# What will need to be paid
	local invoices=$(curl -s ${api_header} https://api.linode.com/v4/account/invoices)

	local s="curl -s ${api_header} https://api.linode.com/v4/account/invoices"
	echo $s
	#eval `$s`
	local t=$(`$s`)
	echo ${t}

	#echo $invoices
}
linode_info
