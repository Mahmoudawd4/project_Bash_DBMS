#!/bin/bash

. "../../helpersFunction.sh"    #to import helper function from the helpersFunction.sh file



echo "Enter name of the table or type (b) to go back to main menu"

check_string	            #to invoke this function from helpersFunction.sh
TableName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

#read TableName

if [  $TableName == "b" ]
    then
        clear 
        echo "error is table name "
        . . ../../manuaistable.sh
    else
        if [[ -f "$TableName" ]]
            then
                #Do update functionality


                echo `head -1 $TableName`

                echo "current column names are :"
                echo #space

                #echo `head -1 $TableName`
                #echo -e "Enter column name to edit on"
                read colName

                if [  $colName == "ID" ]
                then
                echo "the id is uniqe not allow " 
	            . ../../updateTable.sh
                fi

                # Check if the column user inputed is in the table schema.
                actualField=$(awk 'BEGIN{FS=":"}
                    {if(NR==1) 
                    {
                        for(i=1;i<=NF;i++)
                        {
                            if($i=="'$colName'")
                                print i}}}' $TableName)

                if [[ $actualField == "" ]]
                    then
                        echo "Not Found"
                        clear 
                        . . ../../manuaistable.sh
                        
                else
                # take row number from user to edit on 
                    withinRange=0
                    userInputRowNumber=0    #initial value for user input
                    totalRowNumber=0        #itialize this row counter contain's the two metadata rows
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

                        oldValue=$(awk -v FS=':' '/"$colName"/{print NR; exit}' $TableName)
                        colNumber=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$colName'") print i}}}' $TableName)  #return 

                        NR=$(awk 'BEGIN{FS=":"}{if ($'$colNumber' == "'$colName'") print NR}' $TableName)

                        oldValue=$(awk 'BEGIN{FS=":"}{if(NR=='$rowNumber+2'){for(i=1;i<=NF;i++){if(i=='$colNumber') print $i}}}' $TableName )

                        echo "Old value for column \"$colName\" is : $oldValue"

                        echo "enter new value"
                        #check if the value is integer or string  

                        # check_string	#to invoke this function from helpersFunction.sh
                        # newValue=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

                        read newValue
                        user_Input_RowNumber_Plus_Metadata=$(($userInputRowNumber+2))

                        sed -i "$user_Input_RowNumber_Plus_Metadata s/$oldValue/$newValue/g" "$TableName"
                        echo " updated sucess "

                fi

        else
            echo "There is no table with this name!"
            val1="Re-enter table name"
            val2="Back to menu"
            select val in "$val1" "$val2"
            do
                case $val in
                    $val1 ) clear ; . ../../updateTable.sh     ; clear ; break;;
                    $val2 ) clear ; . ../../manuaistable.sh  ; clear ; break;;
                    * ) echo "Erorr choice"
                esac
            done
        

        fi


fi