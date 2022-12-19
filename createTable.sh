

echo "plese Enter the name table :  =========(b)====== to back to ======== MENU : "

#validate new table name
flag=0	#to exit the while loop

TableName=0

while [ $flag == 0 ]
do
	read userTableName
	if [[ $userTableName =~ ^[a-zA-Z]*$ ]]; then 	#correct db name

		TableName=$userTableName	
		flag=1	# to exit the while loop

	else # wrong name 
		echo "Wrong name: Please enter a name composed of only letters either small or capital, without numbers, special chars or spaces."
	fi
done


if [  $TableName == "b" ]
then
	clear 
	. manuaistable.sh
else
	if [[ -f "$TableName" ]]
	then
		echo "Error: the table already exsit"
		val1="please again enter name table :"
		val2="Back to MENU "
		select val in "$val1" "$val2"
		do
			case $val in
				$val1 ) clear ;    . createTable.sh ; clear ; break;;
				$val2 ) clear ; . manuaistable.sh ; clear ; break;;
				* ) echo "Error choice"
			esac
		done
	else
		touch $TableName
		row1="ID:"
		row2="int (Not NULL):"
		echo "ID is creat automatic  ==> (PK)"
		i=2
		function AddDataType {
			echo "Enter Column number $i:"
			read culomn
			row1+="$culomn"
			echo "please Choose the datatype:"
			select datatype in "int" "string"
			do
				case $datatype in
					"int" ) row2+="int"; break;;
					"string" ) row2+="string"; break;;
					* ) echo "Invalid choice";
				esac
			done
			echo "Choose it can be nul or not null:"
			select constrain in "null" "not null"
			do
				case $constrain in
					"null" ) row2+=""; break;;
					"not null" ) row2+=" (Not NULL)"; break;;
					* ) echo "error choice";
				esac
			done
			echo "Insert another column?"
			select check in "yes" "no"
			do
				case $check in
					"yes" )  ((i=i+1)) ;
					row1+=":";row2+=":"; 
					AddDataType ; 
					break ;;
					"no" ) break;;
					* ) echo "error choice";
				esac
			done
		}
		AddDataType
		echo $row1>>$TableName
		echo $row2>>$TableName
		clear
        echo "__________________________________________________"


		echo " table created successfully is ==> $TableName  :"
        
		echo "__________________________________________________"
	fi
fi