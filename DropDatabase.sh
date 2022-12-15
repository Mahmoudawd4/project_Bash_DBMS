
echo "Enter Database name is deleted  || ====>  (b) to back =>>>>>>to MENU: "
read DbName

DB=databases

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
	
	echo "tha database name not found !"
    Result=("Agian Enter Database " "Back to Menu" "Exit")
	select val in "${Result[@]}"
	do
		case $val in
             "Agian Enter Database")
            clear ; . DropDatabase.sh ; clear ; break
            ;;
			 "Back to Menu")
            clear ; . 	. manua.sh ; clear ; break
            ;;
            "Exit")
            echo "exit  " ; exit
            ;;
			* ) echo "error not found "
		esac
	done
fi