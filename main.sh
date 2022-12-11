#!/bin/bash

DB="databases";
declare -a DBARR ;


# function create db 
function create {
	read -p " pleases Enter Name Database : " DBName;
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
