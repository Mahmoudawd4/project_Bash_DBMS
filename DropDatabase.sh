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
else
if [[ -d  "$DB/$DbName" ]]
then

	rm -r -i $DB/$DbName
	if [[ ! -d "$DB/$DbName" ]]
	then
    	echo "Delete susscesfuly "
	fi

else
	echo "Database not found !"
    #Result=("Enter name again " "Back to menu" "Exit")
	val1="Re-enter table name"
    val2="Back to menu"
	val3="Exit"
	select val in "$val1" "$val2" "val3"
	do
		case $val in
             $val1)clear ; . DropDatabase.sh ; clear ; break;;
			 $val2)clear ; . manua.sh ; clear ; break;;
            $val3) exit;;
			* ) echo "error not found "
		esac
	done
fi

fi