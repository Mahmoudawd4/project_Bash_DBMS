#!/usr/bin/bash

. "../../helpersFunction.sh"    #to import helper function from the helpersFunction.sh file


echo "Please Enter table name"

check_string				#to invoke this function from helpersFunction.sh
tableName=$returnValue		#returnValue is the value from helpersFunction.sh check_string()

#read tableName

echo -n "Please Enter id : "
read pk

fieldNum=`awk -F':' -v pk="$pk" '{if($1==pk) print NR}' $tableName`
exitflag=0

while [ $exitflag -eq 0 ];do
	if [ -z $fieldNum ];then
		echo "No such primary key found"
        echo -n "Please enter a valid primay key: "
		read pk
		fieldNum=`awk -F':' -v pk="$pk" '{if($1==pk) print NF}' $tableName`
	else
		exitflag=1
	fi
done

echo "the table is ($tableName), where id = $pk"
echo "###########################################################################"
awk -F':' -v pk="$pk" '{if($1==pk) print}' $tableName
echo "###########################################################################"

