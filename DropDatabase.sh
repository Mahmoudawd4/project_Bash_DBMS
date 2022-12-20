#!/bin/bash

. "./helpersFunction.sh"    #to import helper function from the helpersFunction.sh file

echo "Enter Database name to be droped or enter (b) to go back"

check_string				#to invoke this function from helpersFunction.sh
DbName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

DB=databases	#databases folder that contains all DB's

if [  $DbName == "b"  ]
then
	clear 
	. manua.sh
fi
if [[ -d  "$DB/$DbName" ]]
then

	rm -r -i $DB/$DbName
	if [[ ! -d "$DB/$DbName" ]]
	then
    	echo "Delete susscesfuly "
	fi

else
	echo "Database not found !"
    Result=("Enter name again " "Back to menu" "Exit")
	select val in "${Result[@]}"
	do
		case $val in
             "Enter name again")
            clear ; . DropDatabase.sh ; clear ; break
            ;;
			 "Back to menu")
            clear ; . 	. manua.sh ; clear ; break
            ;;
            "Exit")
            echo "exit  " ; exit
            ;;
			* ) echo "error not found "
		esac
	done
fi