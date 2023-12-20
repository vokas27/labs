#!/bin/bash

adressbook_file="contacts.txt"

function new(){

name=$1
email=$2
echo "$name $email">>$adressbook_file
}

function list(){
if [[ ! -s $adressbook_file ]]; then
       echo "addressbook_file is empty"

     else
cat $adressbook_file
fi
}
function remove (){
name=$1
sed -i "/^$name/d" $adressbook_file
}
function clear() {
rm -f $adressbook_file
}
function lookup (){
name=$1
grep "^$name" $adressbook_file | cut -d: -f2
}

if [[ ! -f $adressbook_file ]]; then
 touch $adressbook_file
fi

case $1 in
   "new")
      new "$2" "$3"
        ;;
    "list")
       list
        ;;
     "remove")
        remove "$2"
       ;;
       "clear")
        clear
        ;;
        "lookup")
         lookup "$2"
        ;;
    *)
echo "Invalid command"
esac