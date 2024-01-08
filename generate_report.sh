#!/bin/bash

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install it before running this script."
    exit 1
fi

# Specify the path to your JSON file
json_file="weather_data.json"

# Specify the key in the JSON file whose value you want to append to the text file
json_key="current.temperature_2m"

# Specify the text file to which you want to append the data
text_file="Report.txt"

# Use jq to extract the value of the specified key from the JSON file
json_value=$(jq -r ".$json_key" "$json_file")

# Append the extracted value to the text file
echo "$(date) Temperature:$json_value °C" >> "$text_file"

echo "Data appended successfully to $text_file"
