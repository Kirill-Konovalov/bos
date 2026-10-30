#!/bin/bash

while IFS= read -r line; do
	echo "$line" | grep -w "bin" >&2
done
