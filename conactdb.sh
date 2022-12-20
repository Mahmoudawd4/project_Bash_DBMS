#!/bin/bash

. "helpersFunction.sh"    #to import helper function from the helpersFunction.sh file


echo "Please enter DB name to connect to , or (b) to go back "

DB=databases


check_string	#to invoke this function from helpersFunction.sh
DBName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

if [  $DBName == "b" ]
then
   clear
	. manua.sh
fi

if [[ -d "$DB/$DBName" ]]
then
   cd $DB/$DBName
   clear 
   echo "conected to DB : $DBName  "
   . ../../manuaistable.sh
else
   echo "databases is not found"
    choice=("Enter DB name again" "create table" "Back to MENU" "Exit")
	select result in "${choice[@]}"
	do
		case $result in
            "Enter DB name again")
            clear ; . ../../conactdb.sh ; clear ; break
            ;;
             "create table")
            clear ; . ../../createTable.sh  ; break
            ;;
			 "Back to MENU")
            clear ; . ../../manua.sh ; clear ; break
            ;;
             "Exit")
            clear ; exit
            ;;
			* ) echo "Error: choice not found !"
		esac
	done
fi