#!/bin/sh

linode_creds() {
	local api_token=$(build_curl "api_token")
	export LINODE_API_TOKEN="${api_token:1:-1}"
}
