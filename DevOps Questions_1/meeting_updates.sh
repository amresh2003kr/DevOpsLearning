#!/bin/bash

# Check if filename is provided as argument
if [ $# -eq 0 ]
	then
	echo "Error: No filename provided"
	exit 1
fi

# Get the current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)
echo $current_date

# Get the next date in YYYY-MM-DD format
next_date=$(date -d "+1 day" +%Y-%m-%d)
echo $next_date

# Read the file and search for meetings scheduled for current or next day
filename=$1
echo $filename

echo "---------------------------------------------"
echo "| Meeting Date | Meeting Time | Meeting Name |"
echo "---------------------------------------------"
while read line
do
# Extract the date, time, and name of the meeting from the line
	meeting_date=$(echo $line | awk '{print $1}')
	meeting_time=$(echo $line | awk '{print $2}')
	meeting_name=$(echo $line | awk '{$1=$2=""; print $0}' | sed 's/^[ \t]*//')

# Check if the meeting is scheduled for current or next day
if [ $meeting_date == $current_date ] || [ $meeting_date == $next_date ]
	then
	# Output the meeting details in table format
	printf "| %-12s| %-12s| %-12s|\n" "$meeting_date" "$meeting_time" "$meeting_name"
fi
done < $filename
echo "---------------------------------------------"

