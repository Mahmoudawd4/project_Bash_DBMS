#!/bin/bash

echo "--- Database manu ----"
echo "please Enter choice :"

choice=("Create DataBase" "List" "Connect To DB" "Drop DB" "Exit")

select result in "${choice[@]}"
do
    case $result in
        "Create DataBase")
           clear ; . createDatabase.sh; . Back.sh
            ;;
        "List")
           clear ; . list.sh ; . Back.sh
            ;;
        "Connect To DB")
            clear ; . conactdb.sh; . Back.sh
            ;;
        "Drop DB")
            clear ; .  DropDatabase.sh ; . Back.sh
            ;;  
        "Exit")
            echo "thanks :: " ; exit
            ;;
        *) clear ; echo "Erorr plese agian enter choice " ; . manua.sh ;;
    esac
done