#!/bin/bash

renew_list()
{
	filename=$1
	
	if [ ! -z "$year" ] ; then
		cat $filename | grep -i -P -q "$filter"
		
		if [ $?=0 ] ; then
			newlist=$'$newlist\n$filename'
		fi
	
	else
		cd UG\ Y16
		ls | grep $filename
		if [ $?=0 ] ; then
			cat $filename | grep -i -P -q "$filter"
			
			if [ $?=0 ] ; then
				newlist=$'newlist\n$filename'
			fi
		fi
		
		cd ../UG\ Y15
		ls | grep $filename
		if [ $?=0 ] ; then
			cat $filename | grep -i -P -q "$filter"
			
			if [ $?=0 ] ; then
				newlist=$'newlist\n$filename'
			fi
		fi
		
		cd ../UG\ Y14
		ls | grep $filename
		if [ $?=0 ] ; then
			cat $filename | grep -i -P -q "$filter"
			
			if [ $?=0 ] ; then
				newlist=$'newlist\n$filename'
			fi
		fi
		
		cd ../UG\ Y13
		ls | grep $filename
		if [ $?=0 ] ; then
			cat $filename | grep -i -P -q  "$filter"
			
			if [ $?=0 ] ; then
				newlist=$'newlist\n$filename'
			fi
		fi
		
		cd ..
	
	fi
}

export -f renew_list

RED='\033[1;31m'
NC='\033[0m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m	'

echo -e "${RED}*****WELCOME to IITK student search*****\n${CYAN}"

echo -e "${PURPLE}Enter value of field and press [ENTER], if field is to be left blank, press [ENTER] without entering any value.\n${CYAN}"

read -p "Roll No.: " Rollno
#echo -e "\n"

if [ ! -z "$Rollno" ] ; then
	echo -e ""
	if [ $Rollno -gt 160000 ] ; then
		if [ $Rollno -lt 160833 ] ; then
		cd UG\ Y16
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
		
	elif [ $Rollno -gt 150000 ] ; then
		if [ $Rollno -lt 150846 ] ; then
		cd UG\ Y15
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
		
	elif [ $Rollno -gt 14000 ] ; then
		if [ $Rollno -lt 14838 ] ; then
		cd UG\ Y14
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
		
	elif [ $Rollno -gt 13000 ] ; then
		if [ $Rollno -lt 13820 ] ; then
		cd UG\ Y13
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
	fi
	
	cd ..	

else
	list=''
	newlist=''
	filter=''
	read -p "Batch: " Batch
		
		year=''
	if [ ! -z "$Batch" ] ; then
		year=$(echo $Batch | grep -P -o '1\d')
		cd UG\ Y$year
		fi
				
	read -p "Name: " Name
	
	if [ ! -z "$Name" ] ; then
		list=$(ls -R | grep -P -i $Name)
		fi
		
	read -p "Program: " Program
	
	if [ ! -z "$Program" ] ; then
		if [ ! -z "$list" ]; then
			filter=$Program
			echo $list | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
			
		else
			filter=$Program
			ls -R | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
		fi
	fi
		
	read -p "Department: " Department
	
	if [ ! -z "$Department" ] ; then
		if [ ! -z "$list" ]; then
			filter=$Department
			echo $list | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
			
		else
			filter=$Department
			ls -R | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
		fi
	fi
		
	read -p "Hostel Info: " Hostelinfo
	
	if [ ! -z "$Hostelinfo" ] ; then
		if [ ! -z "$list" ]; then
			filter=$Hostelinfo
			echo $list | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
			
		else
			filter=$Hostelinfo
			ls -R | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
		fi
	fi
	
	read -p "Gender: " Gender
	
	if [ ! -z "$Gender" ] ; then
		if [ ! -z "$list" ]; then
			filter=$Gender
			echo $list | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
			
		else
			filter=$Gender
			ls -R | xargs -I{} -n 1 -P 0 bash -c 'renew_list {}'
			list="$newlist"
			newlist=''
		fi
	fi
		if [ ! -z "$year" ] ; then
			cd ..
		fi
	
	if [ -z "$list" ] ; then
		echo -e "\nInvalid Credentials"
		
	else
		echo "$list"
	fi
		
fi
	
echo -e "\n"

read -p "Roll No.: " Rollno
#echo -e "\n"

if [ ! -z "$Rollno" ] ; then
	echo -e ""
	if [ $Rollno -gt 160000 ] ; then
		if [ $Rollno -lt 160833 ] ; then
		cd UG\ Y16
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
		
	elif [ $Rollno -gt 150000 ] ; then
		if [ $Rollno -lt 150846 ] ; then
		cd UG\ Y15
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
		
	elif [ $Rollno -gt 14000 ] ; then
		if [ $Rollno -lt 14838 ] ; then
		cd UG\ Y14
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
		
	elif [ $Rollno -gt 13000 ] ; then
		if [ $Rollno -lt 13820 ] ; then
		cd UG\ Y13
		cat "$(ls | grep $Rollno)"
		
		else
		echo "Invalid input"
		fi
	fi
	
	cd ..	
fi
