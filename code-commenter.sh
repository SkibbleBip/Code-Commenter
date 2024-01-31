#!/bin/bash
###############################################################################
#Author: SkibbleBip
#Date: 2-21-2021
#Purpose: This script generates copy-and-pastable code comments for the C language
#	so the user can simply just copy them down without needing to spend time on each header file
#	and function.



fileHeader(){
	echo "Filename:"
	read fileName
	echo "Number of Procedures:"
	read num
	declare -a procedureName
	declare -a procedureDesc


	for(( c=0; c<$num; c++ ))
	do
	echo "Procedure name:"
	read name
	echo "Procedure description:"
	read desc 
	procedureName[c]=$name
	procedureDesc[c]=$desc
	done
	echo -e "\n\n"

	echo "/***************************************************************************"
	echo "* File: " $fileName
	echo "* Author: " $username
	echo "* Procedures: "


	for(( i=0; i<num; i++ ))
	do
		echo -e "* "${procedureName[i]}"\t-"${procedureDesc[i]}

	done

	echo "***************************************************************************/"

}


procedureHeader(){

	echo "Enter function prototype:"
	read prototype
	echo "Enter description:"
	read protoDesc
	echo "Enter number of parameters:"
	read numParams


	declare -a paramName
	declare -a paramIO
	declare -a paramType
	declare -a paramDesc



	for(( i=0; i<numParams; i++ ))
	do
		echo -n "Enter parameter name: "
		read n
		echo -n "Enter parameter IO (I/P, O/P, I/O): "
		read io
		echo -n "Enter parameter type (int, double, char*): "
		read t 
		echo -n "Enter paramter description: "
		read d

		paramName[i]=$n
		paramIO[i]=$io
		paramType[i]=$t
		paramDesc[i]=$d

	done

	echo -e "\n\n"

	echo "/***************************************************************************"
	echo "*" $prototype
	echo "* Author:" $username
	echo -n "* Date: " 
	date +'%m/%d/%Y'
	echo "* Description:" $protoDesc
	echo "*"
	echo "* Parameters:"
	for(( i=0; i<numParams; i++ ))
	do
		echo -e "*\t" ${paramName[i]}"    "${paramIO[i]}"    "${paramType[i]}"    "${paramDesc[i]}

	done

	echo "**************************************************************************/"


}


if [ -f "$HOME/.code-commenter" ]; then
	 username=$(cat "$HOME/.code-commenter" | grep "Name" | awk '{print $2}')
else
	echo "Enter author name:"
	read username
	echo "Name" $username >> "$HOME/.code-commenter"
fi



echo "Author:" $username
echo "What would you like to write comments for?"

echo 	"
	1: File Header (Top of the file)
	2: Class/Procedure Header(On top of a method/function)
	3: Exit
	"

read choice

case $choice in

	1) fileHeader ;;

	2) procedureHeader ;;

	3) echo "Exiting..."
	exit 0
	;;

	*) echo "Don't be stupid"
	exit 1
	;;

esac

