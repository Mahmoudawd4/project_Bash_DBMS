echo "plese Enter the name table to concact (b) to back to MENU: "

DB=databases
read DBName
if [  $DBName == "b" ]
then
   clear
	. manua.sh
fi

if [[ -d "$DB/$DBName" ]]
then
   cd $DB/$DBName
   clear 
   echo "conected the database name is  $DBName  "
   . ../../manuaistable.sh
else
   echo "databases is not found"
    choice=("agian enter databse name" "create table" "Back to MENU" "Exit")
	select result in "${choice[@]}"
	do
		case $result in
            "agian enter databse name")
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
			* ) echo "Choice error is not found"
		esac
	done
fi