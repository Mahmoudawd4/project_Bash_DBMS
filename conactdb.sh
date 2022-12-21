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
   
   . Back.sh


   # echo "databases is not found"
   #  results=("Back to MENU" "Exit")
	# select result in "${results[@]}"
	# do
	# 	case $result in

	# 		 "Back to MENU")
   #          clear ; . ../../manua.sh ; clear ; break
   #          ;;
   #           "Exit")
   #          clear ; exit
   #          ;;
	# 		* ) echo "Error: choice not found !"
	# 	esac
	# done
fi