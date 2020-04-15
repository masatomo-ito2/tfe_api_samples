#!/bin/bash

if [ $# -ne 1 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = org'
		exit 1
fi

curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --request POST --data @create_ws.json https://${TFE_SERVER}/api/v2/organizations/${1}/workspaces 
