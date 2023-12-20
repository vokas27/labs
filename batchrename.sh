#!/bin/bash
directory=$1
original_exten=$2
new_exten=$3

for file in "$directory"/*."$original_exten"; do
      if [ -f "$file" ]; then
           name_file=$(base_name "$file" ".$original_exten")

           new_filename="$filename.$new_exten"

           mv "$file" "$directory/$new_filename"

           echo "Renaming $file to $new_filename"

fi

done