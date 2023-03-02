#!/bin/bash

# Declare an empty array to store the results
# results=()
resultsStr=""
for file in diagrams/*; do
    result=$(curl -s -X POST -F "image=@$file" https://imgurproxy-app-service.azurewebsites.net/upload)
    # results+=("$result")
    resultsStr+="$result"
done
echo $resultsStr
echo "MARKDOWN=$resultsStr" >> $GITHUB_OUTPUT



# echo ${results[@]}
# res=[$(echo ${results[@]} | sed 's/ /, /g')]
# echo $res
# echo "MARKDOWN=$res" >> $GITHUB_OUTPUT
# echo $GITHUB_OUTPUT