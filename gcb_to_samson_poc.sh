#!/usr/bin/env bash

gcb_repo="github_zendesk_bcolfer-hello"
#project_name=$(echo $gcb_project | sed -e 's/github_zendesk_//')# i-hello
gcb_project_id=" docker-image-builder-179319"
project_name="bcolfer-hello"
image_sha="sha256:12e6750329709c1af82a02ebff5a78455fce9cf1106f6d53386977df32afda77"

samson_host="samson.zd-mini.com"
samson_poc_url="http://$samson_host/projects/$project_name/builds.json"
access_token="e8dd29c0cd40d3717bfaeaac3a46300ab4dfa72232cb04eee3e2a1276b0c4ae6"


build_name='GCB Build - 77070a8f-ea13-4dc2-8734-78d899a15114'
build_status="succeeded"
build_url="https://console.cloud.google.com/cloud-build/builds/77070a8f-ea13-4dc2-8734-78d899a15114?project=docker-image-builder-179319"
commit_sha="d54f86509badca0c8e1de4edd0d0673bbdfba1b0"
git_ref="master" # I am not sure how to get this ...
docker_image_digest="https://${gcb_project_id}/apps/${project_name}@${image_sha}"
image_name="${project_name}"

curl -d '{ "name" : "GCB Build - 77070a8f-ea13-4dc2-8734-78d899a15114", "external_status" : "'$build_status'", "external_url" : "'$build_url'", "git_sha" : "'$commit_sha'", "git_ref" : "'$git_ref'", "docker_repo_digest" : "docker-image-builder-179319/apps/bcolfer-hello@sha256:12e6750329709c1af82a02ebff5a78455fce9cf1106f6d53386977df32afda77", "image_name" : "'$project_name'"}' \
        -H "Authorization: Bearer ${access_token}" \
        -H "Content-Type: application/json" \
        $samson_poc_url

# '{ "name" : "'$build_name '",
# "external_status" : "'$build_status  '",
# "external_url" : "' $build_url '",
# "git_sha" : "' $commit_sha '",
# "git_ref" : "' $git_ref '",
# "docker_repo_digest" : "'$docker_image_digest'",
# "image_name" : "'$project_name'"}'
