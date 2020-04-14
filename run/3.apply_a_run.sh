#!/bin/bash

if [ $# -ne 2 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = org'
		echo '  $2 = workspace'
		exit 1
fi

# get workspace id
WORKSPACE_ID=$(curl --header "Authorization: Bearer ${TOKEN}"   --header "Content-Type: application/vnd.api+json" https://${TFE_SERVER}/api/v2/organizations/${1}/workspaces/${2} | jq -r '.data.id')

echo ${WORKSPACE_ID}

RUN_ID=$(curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" https://${TFE_SERVER}/api/v2/workspaces/${WORKSPACE_ID}/runs?page%5Bsize%5D=1 | jq -r '.data[0].id' )

echo ${RUN_ID}

# apply a run
curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --request POST --data @apply_run.json https://${TFE_SERVER}/api/v2/runs/${RUN_ID}/actions/apply

