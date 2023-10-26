#!/bin/bash

git_url="https://github.com/username/repository.git"


echo "${git_url}"
# Remove '.git' from the end of the URL
raw_url="${git_url%.*}"
echo "${raw_url}"
# Add 'raw.githubusercontent.com' and adjust the URL to access raw content
raw_url="https://raw.githubusercontent.com${raw_url#https://github.com}"

echo "Raw Content URL: $raw_url"