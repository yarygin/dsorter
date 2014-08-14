# /usr/bin/bash
DIR=$1
if [[ -d "$DIR" || -L "$DIR" ]] ; then
    for file in "$DIR"/*; do 
    	if [[ ! -d "$file" && ! -L "$file" ]] ; then
	     	ext=${file##*.}
	     	filename=$(basename "$file")
	    	if [[ ! -d "$DIR/$ext" && ! -L "$DIR/$ext" ]]; then
	     		mkdir -v $DIR/$ext
	     	fi
	     	mv -v "$DIR/$filename" "$DIR/$ext/$filename"
	    fi
    done
else 
    echo "$DIR is not a directory"
fi