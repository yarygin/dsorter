# /usr/bin/bash
input=$1
output=$2
if [[ "$#" -eq 1 ]] ; then
	output=$input
fi
if [[ -d "$output" || -L "$output" ]] ; then
	if [[ -d "$input" || -L "$input" ]] ; then
		for file in "$input"/*; do 
			if [[ ! -d "$file" && ! -L "$file" ]] ; then
				ext=${file##*.}
				filename=$(basename "$file")
				if [[ ! -d "$output/$ext" && ! -L "$output/$ext" ]]; then
					mkdir -v $output/$ext
				fi
				mv -v "$input/$filename" "$output/$ext/$filename"
			fi
		done
	else 
		echo "$input is not a directory"
	fi
else 
	echo "$output is not a directory"

fi