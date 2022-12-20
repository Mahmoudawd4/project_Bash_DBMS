#!/bin/bash

    echo "b ============> to back : "
    echo  "Enter Table Name:"
    read TableName
    
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