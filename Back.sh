#!/bin/bash
echo "please choose input"
choices=("Back to MENU" "Exit")
select result in "${choices[@]}"
do
    case $result in
        "Back to MENU")
            clear ; . manua.sh
            ;;  
        "Exit")
            clear ; exit
            ;;
        *) clear ; echo "Error ooption " ; . Back.sh ;;
    esac
done