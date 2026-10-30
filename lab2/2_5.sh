#!/bin/bash

files=(/home/admin/*)
duplicates=()

for ((i = 0; i < ${#files[@]}; i++)); do
	if [ ! -f "${files[i]}" ]; then
		continue
	fi

	for ((j = i + 1; j < ${#files[@]}; j++)); do
		if [ -f "${files[j]}" ] && cmp -s "${files[i]}" "${files[j]}"; then
			found=0
			for file in "${duplicates[@]}"; do
				if [ "$file" = "${files[i]}" ]; then
					found=1
					break
				fi
			done

			if [ "$found" -eq 0]; then
				duplicates+=("${files[i]}")
			fi

			found=0
			for file in "${duplicates[@]}"; do
				if [ "$file" = "${files[j]}" ]; then
					found=1
					break
				fi
			done

			if [ "$found" -eq 0]; then
				duplicates+=("${files[j]}")
			fi
		fi
	done
done

echo "Count of files with duplicates: ${#duplicates[@]}"

for file in "${duplicates[@]}"; do
	echo "$file"
done
