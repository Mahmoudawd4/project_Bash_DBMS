#!/bin/bash

. "./helpersFunction.sh"    #to import helper function from the helpersFunction.sh file

DB="databases";
declare -a DBARR ;

# function create db 
function create {
	
	echo "Please enter database name"
	check_string	#to invoke this function from helpersFunction.sh

	DBName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

	if [[ ! -d $DB/$DBName ]];
		then	mkdir $DB/$DBName;
				if [[ $? -eq 0 ]]; then
					echo $DB" Database created successfully" ;
				else	
					echo "Error Creating  Database" ;
				fi
	else	
		echo "Database already exists";
	fi
}
create


