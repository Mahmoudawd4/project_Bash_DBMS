#!/bin/bash

. "../../helpersFunction.sh"    #to import helper function from the helpersFunction.sh file


echo "please enter table name"

check_string				#to invoke this function from helpersFunction.sh
TableName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

#read TableName
awk '(NR>2)'  $TableName 
echo	#to create empty line 
if [[ $? != 0 ]]
then
	echo "Error Displaying Table $TableName"
else
		val1="Re-enter name of table"
		val2="Back to MENU"
		select val in "$val1" "$val2"
		do
			case $val in
				$val1 ) clear ; . ../../select_all_data.sh     ; clear ; break;;
				$val2 ) clear ; . ../../manuaistable.sh; clear ; break;;
				* ) echo "Erorr choice"
			esac
		done
fi