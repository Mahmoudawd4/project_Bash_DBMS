#!/bin/bash


function check_string(){
    echo "inside check_string"

    returnValue=0	#initialize db name 

    flag=0	#to exit the while loop


    while [ $flag == 0 ]
    do
    
        read userInput
        if [[ $userInput = "" ]]; then
            echo "Wrong name: Please enter a name composed of only letters either small or capital, without numbers, special chars or spaces."

        elif [[ $userInput =~ ^[a-zA-Z]*$ ]]; then 	#correct db name

            returnValue=$userInput	# to exit the while loop
            flag=1

        else # wrong dbname 
            echo "Wrong name: Please enter a name composed of only letters either small or capital, without numbers, special chars or spaces."
        fi
    done

    #echo $returnValue
    #returnValue=0
}

