#!/bin/bash
  echo -e "please enter table name : \c"
  read TableName
  awk '(NR>2)'  $TableName 
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