
echo "Enter the chice :"

option1="Create table"
option2="List tables in database"
option3="Insert table"
option4="Delete redord by id"
option5="Drop table"
option6="Select table"
option7="select all"
option8="Exit"
select val in  "$option1" "$option2" "$option3" "$option4" "$option5" "$option6" "$option7" "$option8"
do
	case $val in
		$option1 ) clear ; . ../../createTable.sh          ; . ../../manuaistable.sh;; 
		$option2 ) clear ; . ../../showtable.sh ; . ../../manuaistable.sh;;
		$option3 ) clear ; . ../../insertTable.sh ; . ../../manuaistable.sh;;
		$option4 ) clear ;. ../../deleteTable.sh; . ../../manuaistable.sh;;
		$option5 ) clear ; . ../../dropTable.sh;. ../../manuaistable.sh;;
		$option6 ) clear ; . ../../selectfrom.sh;. ../../manuaistable.sh;;
		$option7 ) clear ; . ../../select_all_data.sh  ; . ../../manuaistable.sh;;
		$option8 ) echo "thanks "              ; exit;;
		* )     clear ; echo "Invalid error" ; . ../../manuaistable.sh ; 
	esac
done