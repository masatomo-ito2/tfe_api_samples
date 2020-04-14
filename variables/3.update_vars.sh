#!/bin/bash

if [ $# -ne 3 ]
	then
	echo 'Needs to supply argument'
	echo '  $1 = org'
	echo '  $2 = workspace'
	echo '  $3 = var'
		exit 1
fi

WORKSPACE_ID=$(curl --header "Authorization: Bearer ${TOKEN}"   --header "Content-Type: application/vnd.api+json"   https://${TFE_SERVER}/api/v2/organizations/${1}/workspaces/${2} | jq -r '.data.id')

FILTER=".data[] | select(.attributes.key == \"${3}\") | .id"
VAR_ID=$(curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" https://${TFE_SERVER}/api/v2/workspaces/${WORKSPACE_ID}/vars | jq -r "$FILTER" )

curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --request PATCH --data @update_vars.json https://${TFE_SERVER}/api/v2/workspaces/${WORKSPACE_ID}/vars/${VAR_ID} 
