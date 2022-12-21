#!/bin/bash
index=1
clear
echo "list tables "
echo "*************************************"



for db in `ls `
do
	echo $index - $db
	index=$[$index + 1]
done





echo "*************************************"

echo "Please enter the number of choice: "
options=("Back" "Exit")
select val in "${options[@]}"
do
    case $val in
        "Back")
            clear ; . ../../manuaistable.sh;
            ;;  
        "Exit")
            clear ; exit
            ;;
        *) echo "error choice" ;;
    esac
done