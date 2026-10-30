#!/bin/bash

for number in $@; do
    if (( number % 3 == 0 )); then
        continue
    elif (( number % 2 == 0 )); then
        echo "$number" >> "even.txt"
    else
        echo "$number" >> "odd.txt"
    fi
done

echo "Number of processed numbers: $#"

