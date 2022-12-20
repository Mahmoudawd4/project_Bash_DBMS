#!/bin/bash

. "../../helpersFunction.sh"    #to import helper function from the helpersFunction.sh file


    echo  "Enter Table Name to be droped, or (b) to go back"

	check_string				#to invoke this function from helpersFunction.sh
	TableName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

    #read TableName
    
if [  $TableName == "b" ]
then
	clear 
	. ../../manuaistable.sh
fi
if [[ -f "$TableName" ]]
then
	rm -i $TableName
	if [[ ! -f $TableName ]]
	then
    	echo "Deleted table "
	fi
else
	val1="agin name of Table"
	val2="Back"
	echo "the name table is not table "
	select val in "$val1" "$val2"
	do
		case $val in
			$val1 ) clear ; . ../../dropTable.sh ; clear ; break;;
			$val2 ) clear ; . ../../manuaistable.sh ; clear ; break;;
			* ) echo "error choice"
		esac
	done
fi