#!/bin/bash
sleep $((RANDOM % 60)) 
source_workspace_id=$1
remote_consumer_id=$2
tfc_api_url="https://app.terraform.io/api/v2/workspaces/$source_workspace_id/relationships/remote-state-consumers"

curl \
    -X POST --url "${tfc_api_url}" \
    -H "Authorization: Bearer ${TF_API_TOKEN}" \
    -H "Content-Type: application/vnd.api+json" \
    -d '{"data":[{"id":"'"$remote_consumer_id"'","type":"workspaces"}]}';
