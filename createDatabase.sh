#!/bin/bash


. "./helpersFunction.sh"    #to import helper function from the helpersFunction.sh file


DB="databases";
declare -a DBARR ;

# function create db 
function create {
	
	echo "Please enter database name"
	check_string

	# DBName=0	#initial value for dbname

	# flag=0	#to exit the while loop

	# while [ $flag == 0 ]
	# do
	# 	read userDbName
	# 	if [[ $userDbName =~ ^[a-zA-Z]*$ ]]; then 	#correct db name

	# 		DBName=$userDbName	# to exit the while loop
	# 		flag=1

	# 	else # wrong dbname 
	# 		echo "Wrong DB name: Please enter a name composed of only letters either small or capital, without numbers, special chars or spaces."
	# 	fi
	# done
	    echo "outside checkString"
		
	DBName=$(check_string)


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


