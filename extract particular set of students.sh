#!/bin/bash

curl -s http://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp?sbm=Y -d typ="stud" -d numtxt="160462" | grep -P -A1 'Gender:' | tail -1 | grep -P 'F'
if [ $? =  0 ] ; then
 echo YES

else
echo No

fi
