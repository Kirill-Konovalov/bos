#!/bin/bash

log="/tmp/run.log"
current_date=`date`

echo "$current_date" >> "$log"

echo "Hello, World!"

if [ -f "$log" ]; then
	count=$(wc -l < "$log")
else
	count=0
fi

echo "$count" >&2
