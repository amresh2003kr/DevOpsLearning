#!/bin/bash

# Check if array of words is provided as argument
if [ $# -eq 0 ]
  then
  echo "Error: No array of words provided"
  exit 1
fi

# Get the array of words
words=("$@")

# Find all permutations of the words
permutations_words=$(echo "${words[@]}" | tr ' ' '\n' | awk '{
if (length(head)) for (i=1;i<=length($0);i++) 
	{
	for (j=1;j<=length(head)+1;j++) 
		{
		 printf "%s%s ",substr(head,1,j-1),substr($0,i,1)substr(head,j)
		}
	} else {
	        head=$0; printf "%s ",$0
	       }
}')

# Initialize the concatenated substring
concatenated=""

# Loop through each permutation and check if it contains all the words
for perm in $permutations_words
do
# Remove any leading/trailing whitespace from the permutation
perm=$(echo $perm | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
									    
# Check if the permutation contains all the words
if echo "$perm" | grep -q -w "${words[@]}"
then
# Concatenate the permutation to the final result
concatenated="$concatenated$perm"
fi
done

# Output the final concatenated substring
echo $concatenated

