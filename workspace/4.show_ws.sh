#!/bin/bash

if [ $# -ne 2 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = org'
		echo '  $2 = workspace'
		exit 1
fi

curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" https://${TFE_SERVER}/api/v2/organizations/${1}/workspaces/${2}
