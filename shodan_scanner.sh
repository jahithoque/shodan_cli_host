#!/bin/bash

# Before running this script, make sure that you have initialized shodan using "shodan init <API KEY>" command
# Check if an input file was provided as an argument
if [[ -z "$1" ]]; then
  echo "Usage: $0 <input-file>"
  exit 1
fi

# Get the input file name from the first command-line argument
INPUT_FILE="$1"

# Define the output file name
OUTPUT_FILE="shodan_results.txt"

# Loop through each IP address in the input file
while read IP; do
  # Print a message indicating which IP is being processed
  echo "Running Shodan host command for $IP"
  
  # Run the Shodan host command for the current IP and append the results to the output file
  shodan host "$IP" >> "$OUTPUT_FILE"
done < "$INPUT_FILE"

