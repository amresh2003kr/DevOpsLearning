#!/bin/bash

# Check if command line argument is provided
if [ $# -eq 0 ]
	then
	echo "Error: No input data provided"
	exit 1
fi

# Read the input data into a variable
input=$1

# Reverse the input string using 'rev' command
reverse=$(echo "$input" | rev)

# Print the reversed string
echo "$reverse"

