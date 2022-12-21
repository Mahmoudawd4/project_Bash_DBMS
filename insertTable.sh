#!/bin/bash

. "../../helpersFunction.sh"    #to import helper function from the helpersFunction.sh file

echo "Enter name of the table to insert into, or (b) to go back to main menu: "

check_string	#to invoke this function from helpersFunction.sh
TableName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

#read TableName
if [  $TableName == "b" ]
then
	clear 
	.  ../../manuaistable.sh
else
	if [[ -f "$TableName" ]]
	then
		#count number of record
		NF=$(awk -F : 'END{print NR}' $TableName)
		((id = $NF - 1 )) 
		row="$id:"
		#count number of filed
		record=$(awk -F : 'END{print NF}' $TableName)
		for (( i = 2; i <= $record ; i++ )) 
		do
			name=$(awk -F : 'BEGIN {record = '$i'}{if(NR==1){print $record;}}' $TableName)
			datatype=$(awk -F : 'BEGIN {record = '$i'}{if(NR==2){print $record;}}' $TableName)

			echo "current column names are :"
			echo `head -1 $TableName`
			echo #create space

			echo "Insert values into column ($name):"
			read val
			if [[ $datatype == *"Not NULL"* ]]
			then
				while  [[ $val == "" ]] 
				do
					echo  "the record can't be empty ==> not null!"
					read val
				done			
			fi
			if [[ $datatype == *"int"* ]]
			then
				while ! [[ $val =~ ^[0-9]*$ ]] 
				do
					echo  "Error: you enterd a string, please enter an integer !"
					read val
					while  [[ $val == "" ]] 
					do
						echo  "the record must is not empty!"
						read val
					done
				done
			fi
			if [[ i -eq $record ]]
			then
				row+="$val"
			else
				row+="$val:"
			fi
		done
		echo $row>>$TableName
		clear
		echo "The record is inserted to $TableName successfully :)"
		echo "Insert another record?"
		select check in "Yes" "No"
		do
			case $check in
				"Yes" ) clear ; . ../../insertTable.sh   ; clear ; break;;
				"No" )  clear ; . ../../manuaistable.sh     ; clear ; break;;
				* ) echo "Erorr choice";
			esac
		done
		
	else
		echo "There is no table with this name!"
		val1="Re-enter name of table"
		val2="Back to MENU"
		select val in "$val1" "$val2"
		do
			case $val in
				$val1 ) clear ; . ../../insertTable.sh     ; clear ; break;;
				$val2 ) clear ; . ../../manuaistable.sh; clear ; break;;
				* ) echo "Erorr choice"
			esac
		done
	fi
fi


