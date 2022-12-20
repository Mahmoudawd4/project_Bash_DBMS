#!/bin/bash

function deleteRecordByid
{
    echo "(b) to back : "
    echo  "Enter Table Name:"
    read TableName

    echo "pleses Enter id in table deleted:"
	read id

	if [  $id == "back" ]
	then
		clear 
			.  ../../manuaistable.sh
	else
		if ! [[ $id =~ ^[0-9]*$ ]]
		then
			echo "Error iD ===> id is not number"
			val1="re agian enter id valid :"
			val2="backe to "
			select val in "$val1" "$val2"
			do
				case $val in
					$val1 ) clear ; deleteRecordByid ; break;;
					$val2 ) clear ; .  ../../manuaistable.sh ; clear ; break;;
					* ) echo "Error choices"
				esac
			done
		else
            #get
			check=$(awk -F : 'BEGIN {pk = '$id'}{if($1==pk){print $0;}}' $TableName)
                    #check id is reight
			if [[ $check == "" ]]
			then
				echo "error id =====> id is not right "
				val1="re agian enter id valid "
				val2="Back to MENU"
				select val in "$val1" "$val2"
				do
					case $val in
						$val1 ) clear ; deleteRecordByid ; break;;
						$val2 ) clear ; .  ../../manuaistable.sh ; clear ; break;;
						* ) echo "Error choices"
					esac
				done
            else    

               if [ "$id" = "`awk -F ":" '{NF=1; print $1}' $TableName | grep "\b$id\b" `" ]
                then 
                 row=`awk 'BEGIN{FS=":"}{if ($1=="'$id'") print NR}' $TableName`
                 `sed -i ''$row'd' $TableName`
                    echo "Record deleted "

                else 
                   echo "This id doesn't exist"
                fi
            fi     
		fi
	fi
}

deleteRecordByid