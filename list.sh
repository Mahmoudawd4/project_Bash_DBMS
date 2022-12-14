#!/bin/bash

index=1

DB=databases

for db in `ls $DB/`
do
	echo $index - $db
	index=$[$index + 1]
done

