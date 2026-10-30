#!/bin/bash

bytes=0
strings=0

for file in /home/admin/*.txt
do
	echo "$file"
	size=$(wc -c < "$file")
	length=$(wc -l < "$file")

	bytes=$((bytes + size))
	strings=$((strings + length))
done

echo "Bytes: $bytes"
echo "Count og strings: $strings"
