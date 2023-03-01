#!/bin/bash

# Declare an empty array to store the results
results=()

# Loop through all PNG files in the diagrams directory
for file in diagrams/*.png; do
  # Run the curl command and store the result in the array
  result=$(curl -s -X POST -F "image=@$file" https://imgurproxy-app-service.azurewebsites.net/upload)
  results+=("$result")
done

# Print the array of results
printf '%s\n' "${results[@]}"