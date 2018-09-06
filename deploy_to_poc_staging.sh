#!/usr/bin/env bash

commit_sha="d54f86509badca0c8e1de4edd0d0673bbdfba1b0"
raw_repo="github_zendesk_bcolfer-hello"
repo_for_samson=$(echo $raw_repo | sed -e 's/github_zendesk_//')
webhook_token="e8dd29c0cd40d3717bfaeaac3a46300ab4dfa72232cb04eee3e2a1276b0c4ae6"
webhook_url="http://samson.zd-mini.com/integrations/generic/20b22277ac3ef94c9bb9f1cbb197ac7f
"
curl -d '{"deploy":{"branch":"master","commit":{"sha":"'$commit_sha'","message":"hello!"}}}' \
        -H "Authorization: Basic ${webhook_token}" \
        -H "Content-Type: application/json" \
        -X POST $webhook_url
