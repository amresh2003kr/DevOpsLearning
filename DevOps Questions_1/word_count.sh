#!/bin/bash

# Check if filename is provided as argument
if [ $# -eq 0 ]
	then
	echo "Error: No filename provided"
	exit 1
fi

# Read the file and count the occurrences of each word
filename=$1
cat $filename | tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]' '[\n*]' | sort | uniq -c | sort -nr

# Explanation of the command used:
# cat $filename: Reads the contents of the file
# tr '[:upper:]' '[:lower:]': Converts all words to lowercase for case-insensitivity
# tr -cs '[:alnum:]' '[\n*]': Replaces non-alphanumeric characters with newlines
# sort: Sorts the words alphabetically
# uniq -c: Counts the occurrences of each unique word
# sort -nr: Sorts the output by count in descending order

