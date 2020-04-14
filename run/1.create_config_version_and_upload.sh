#!/bin/bash

if [ $# -ne 2 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = org'
		echo '  $2 = workspace'
		exit 1
fi

# get workspace id
WORKSPACE_ID=$(curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" https://${TFE_SERVER}/api/v2/organizations/${1}/workspaces/${2} | jq -r '.data.id')

echo $WORKSPACE_ID

# show configration versions
UPLOAD_URL=$(curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --request POST --data @configuration_version.json https://${TFE_SERVER}/api/v2/workspaces/${WORKSPACE_ID}/configuration-versions | jq -r '.data.attributes."upload-url"' )

echo $UPLOAD_URL

# create tar ball
tar cvfz main.tar.gz -C tf_files .

curl --header "Authorization: Bearer ${TOKEN}" --header "Content-Type: application/vnd.api+json" --request PUT --data-binary @main.tar.gz ${UPLOAD_URL}

