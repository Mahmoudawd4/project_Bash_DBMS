
echo "Enter Database name to be droped or enter (b) to go back: "

DbName=0	#initialize db name 

flag=0	#to exit the while loop

while [ $flag == 0 ]
do
	read userInput
	if [[ $userInput = "" ]]; then
		echo "Wrong DB name: Please enter a name composed of only letters either small or capital, without numbers, special chars or spaces."

	elif [[ $userInput =~ ^[a-zA-Z]*$ ]]; then 	#correct db name

		DbName=$userInput	# to exit the while loop
		flag=1

	else # wrong dbname 
		echo "Wrong DB name: Please enter a name composed of only letters either small or capital, without numbers, special chars or spaces."
	fi
done

DB=databases	#databases folder that contains all DB's

if [  $DbName == "b"  ]
then
	clear 
	. manua.sh
fi
if [[ -d  "$DB/$DbName" ]]
then

	rm -r -i $DB/$DbName
	if [[ ! -d "$DB/$DbName" ]]
	then
    	echo "Delete susscesfuly "
	fi

else
	echo "Database not found !"
    Result=("Enter name again " "Back to menu" "Exit")
	select val in "${Result[@]}"
	do
		case $val in
             "Enter name again")
            clear ; . DropDatabase.sh ; clear ; break
            ;;
			 "Back to menu")
            clear ; . 	. manua.sh ; clear ; break
            ;;
            "Exit")
            echo "exit  " ; exit
            ;;
			* ) echo "error not found "
		esac
	done
fi