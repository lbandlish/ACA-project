#!/bin/bash

saveID()
{
	rollno=$1
	#batch=$2
	student_html=$(curl -s -L http://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp?sbm=Y -d typ="stud" -d numtxt=${rollno})
	name=$(echo "${student_html}" | grep -P -A1 'Name:' | tail -1 | grep -P -o '(\S+\s+)*\S+' | sed 's/\s\+/\ /g')
	
	#touch "${rollno}  ${name}"
	#for i in "Name: " "Gender:"; do
	#append_field $i "${rollno}  ${name}" ${student_html}
	echo $'Name:' >> "${rollno}  ${name}"	
	echo $name >> "${rollno}  ${name}"
	
	echo $'\nRoll No.:' >> "${rollno}  ${name}"
	echo $rollno >> "${rollno}  ${name}"
	
	echo $'\nProgram:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -A1 'Program:' | tail -1 | grep -P -o '(\S+\s+)*\S+' >> "${rollno}  ${name}"

	echo $'\nDepartment:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -A1 'Department:' | tail -1 | grep -P -o '(\S+\s+)*\S+' >> "${rollno}  ${name}"
	
	echo $'\nHostel Info:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -A1 'Hostel Info:' | tail -1 | grep -P -o '(\S+\s+)*\S+' >> "${rollno}  ${name}"
	
	echo $'\nE-mail:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -o '">.*@iitk.ac.in' | sed 's/">//' >> "${rollno}  ${name}"
	
	echo $'\nCategory:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -o 'Category:</b>.*' | sed  's_Category:</b>\(.*\)<br></P>-->_\1_' >> "${rollno}  ${name}"
	
	echo $'\nGender:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -A1 'Gender:' | tail -1 | grep -P -o '(\S+\s+)*\S+' >> "${rollno}  ${name}"
	
	echo $'\nCountry of origin:' >> "${rollno}  ${name}"
	echo "${student_html}" | grep -P -A1 'CountryOfOrigin:' | tail -1 | grep -P -o '(\S+\s+)*\S+' >> "${rollno}  ${name}"

}

#append_field()
#{
#	field=$1
#	rollno=$2
#	student_html=$3
#	
#}

export -f saveID

mkdir "UG Y16"; cd "UG Y16"

(seq 160001 160832) | xargs -I {} -n 1 -P 0 bash -c 'saveID {}'

cd ..

mkdir "UG Y15"; cd "UG Y15"

(seq 150001 150845) | xargs -I {} -n 1 -P 0 bash -c 'saveID {}'

cd ..
		
mkdir "UG Y14"; cd "UG Y14"

(seq 14001 14837) | xargs -I {} -n 1 -P 0 bash -c 'saveID {}'

cd ..

mkdir "UG Y13"; cd "UG Y13"

(seq 13001 13819) | xargs -I {} -n 1 -P 0 bash -c 'saveID {}'

cd ..

