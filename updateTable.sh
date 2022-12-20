
echo "Enter name of the table or type (b) to go back to main menu: "
read TableName
if [  $TableName == "b" ]
    then
        clear 
        . . ../../manuaistable.sh
    else
        if [[ -f "$TableName" ]]
            then
                #Do update functionality

                echo -e "Enter column name to edit on"
                read colName
                colNumber=0 ##I will calculate it from the next loop to use it later in  updating the cell

                # Check if the column user inputed is in the table schema.
                actualField=$(awk 'BEGIN{FS=":"}
                    {if(NR==1) 
                    {
                        for(i=1;i<=NF;i++)
                        {
                            if($i=="'$colName'")
                                print i}}}' $TableName)

                echo "col number = $colNumber"


                if [[ $actualField == "" ]]
                    then
                        echo "Not Found"
                        clear 
                        . . ../../manuaistable.sh
                        
                else
                # take row number from user to edit on 
                    withinRange=0
                    userInputRowNumber=0    #initial value for user input
                    while [ $withinRange == 0 ]
                        do
                            echo "Enter row number to update on"
                            read rowNumber

                            totalRowNumber=$(awk 'END{print NR}' $TableName) #this row counter contain's the two metadata rows
                            actualRowNumber=$(($totalRowNumber - 2))

                            if [ $rowNumber -le $actualRowNumber ]
                                then    
                                    echo "within range"
                                    userInputRowNumber=$rowNumber
                                    withinRange=1  #to exit while
                                else
                                    echo "out of table range"

                            fi
                        

                        done
                        echo "user input row number = $userInputRowNumber"

                        #oldData=$(awk 'NR ==$userInputRowNumber $ ' $TableName)


                        #oldValue=$(awk 'BEGIN{FS=":"}{if(NR=='$userInputRowNumber'){for(i=1;i<=NF;i++){if(i=='$colName') print $i}}}' $TableName)

                        oldValue=$(awk -v FS=':' '/"$colName"/{print NR; exit}' $TableName)
                        fid=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colName'") print i}}}' $TableName)
                                                echo "fid is $fid"

                        NR=$(awk 'BEGIN{FS=":"}{if ($'$fid' == "'$colName'") print NR}' $TableName)
                         echo "N R is $NR"
                        oldValue=$(awk 'BEGIN{FS=":"}{if(NR=='$rowNumber+2'){for(i=1;i<=NF;i++){if(i=='$fid') print $i}}}' $TableName )

                        echo "old value is $oldValue"
                        echo "Out of while loop"
                        echo "Old value for column \"$colName\" is : $oldValue"
                        echo "enter new value :"
                        read newValue

                        #sed





                fi

        else
            echo "There is no table with this name!"
            val1="Re-enter table name"
            val2="Back to menu"
            select val in "$val1" "$val2"
            do
                case $val in
                    $val1 ) clear ; . ../../insertTable.sh     ; clear ; break;;
                    $val2 ) clear ; . ../../manuaistable.sh; clear ; break;;
                    * ) echo "Erorr choice"
                esac
            done
        

        fi


fi