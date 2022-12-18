

echo "Enter name of the table or type (b) to go back to main menu: "
read TableName
if [  $TableName == "back" ]
then
	clear 
	. . ../../manuaistable.sh
else
	if [[ -f "$TableName" ]]
	then
		NF=$(awk -F : 'END{print NR}' $TableName)
		((id = $NF - 2 )) 
		row="$id:"
		record=$(awk -F : 'END{print NF}' $TableName)
		for (( i = 2; i <= $record ; i++ )) 
		do
			name=$(awk -F : 'BEGIN {record = '$i'}{if(NR==1){print $record;}}' $TableName)
			datatype=$(awk -F : 'BEGIN {record = '$i'}{if(NR==2){print $record;}}' $TableName)
			echo "insert valus is record ($name):"
			read val
			if [[ $datatype == *"Not NULL"* ]]
			then
				while  [[ $val == "" ]] 
				do
					echo  "the record can't be ==> not null!"
					read val
				done			
			fi
			if [[ $datatype == *"int"* ]]
			then
				while ! [[ $val =~ ^[0-9]*$ ]] 
				do
					echo  "Error data type int //please enter enteger !"
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


