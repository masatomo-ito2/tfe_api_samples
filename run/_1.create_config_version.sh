#!/bin/bash

if [ $# -ne 2 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = org'
		echo '  $2 = workspace'
		exit 1
fi

# get workspace id
WORKSPACE_ID=$(curl --header "Authorization: Bearer ${TOKEN}"   --header "Content-Type: application/vnd.api+json"   https://${TFE_SERVER}/api/v2/organizations/${1}/workspaces/${2} | jq -r '.data.id')

# show configration versions
curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --request POST --data @configuration_version.json https://${TFE_SERVER}/api/v2/workspaces/${WORKSPACE_ID}/configuration-versions


