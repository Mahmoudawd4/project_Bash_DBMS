
echo "Enter the chice :"

option1="Create table"
option2="List tables in database"
option3="Insert table"
option4="Update table"
option5="Delete table"
option6="Drop table"
option7="Select table"
option8="Exit data base"
option9="Exit"
select val in  "$option1" "$option2" "$option3" "$option4" "$option5" "$option6" "$option7" "$option8" "$option9"
do
	case $val in
		$option1 ) clear ; . ../../createTable.sh          ; . ../../manuaistable.sh;; 
		$option2 ) clear ;  . ../../manuaistable.sh;;
		$option3 ) clear ; . ../../insertTable.sh ; . ../../manuaistable.sh;;
		$option4 ) clear ; . ../../updateTable.sh ; . ../../manuaistable.sh;;
		$option5 ) clear ; . ../../manuaistable.sh;;
		$option6 ) clear ; . ../../manuaistable.sh;;
		$option7 ) clear ; . ../../manuaistable.sh;;
		$option8 ) clear ; cd ../..        ; . ../../manuaistable.sh;;
		$option9 ) echo "thanks "              ; exit;;
		* )     clear ; echo "Invalid error" ; . ../../manuaistable.sh ; 
	esac
done