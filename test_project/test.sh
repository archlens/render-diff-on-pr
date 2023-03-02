#!/bin/bash

resultsStr=""
for file in diagrams/*; do
    result=$(curl -s -X POST -F "image=@$file" https://imgurproxy-app-service.azurewebsites.net/upload)
    resultsStr+="$result<br>"
done
echo -e $resultsStr
echo "MARKDOWN=$resultsStr" >> $GITHUB_OUTPUT

