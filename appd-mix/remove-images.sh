#!/bin/bash

list=`docker images | grep none | awk '{print $3}'`

#Print the list with echo
echo -e "echo: \n$list"

#Set the field separator to new line
IFS=$' '

docker rmi $list
#Try to iterate over each line
echo "For loop:"
for item in $list
do
    items=$items" "$item 
done

echo $items
