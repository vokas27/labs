#!/bin/bash

function create_file(){
filename=$1

touch $filename
}

username=$(whoami)

n=1

if ls | grep -q "$username"; then

     n=$(ls | grep  "$username" | sort -n | tail -1 | cut -d "-" -f2)
fi

for  k in {1..24}; do


  n=$((n+1))

create_file "$username-$n"
done
echo "Created 25 files"
create_file "$username-$n"