#!/bin/bash

#if [ $# -eq 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

curl   --header "Authorization: Bearer ${TOKEN}"   --header "Content-Type: application/vnd.api+json"   https://${TFE_SERVER}/api/v2/workspaces/ws-k79BrnepJ1rqyNNa/vars
