#!/bin/bash

printf "File:\n(1)Create File\n(2)Open File(From Home Directory(.txt))\n"

read tf

if (( tf == 1 ));
then
if [ -f ~/list.txt ]; then
    rm -r ~/list.txt
fi
touch ~/list.txt
fi

fp=~/list.txt

while (( 1 == 1));
do

printf "Instuction:\n(1)Add\n(2)Update\n(3)Find\n"

read ti

#ADD
if (( ti == 1 ));
then
read -p 'Student ID: ' std_id
while (( ${#std_id} != 8 ));
do
read -p "Enter Correct Student ID(8 Digits): " std_id
done
read -p 'Student Username: ' std_name
echo $std_id : $std_name >> $fp

#UPDATE
elif (( ti == 2 ));
then
read -p 'Current Student ID: ' std_id
while (( ${#std_id} != 8 ));
do
read -p "Enter Correct Student ID(8 Digits): " std_id
done
 if grep -q $std_id "$fp"; then
   read -p 'New Student Username: ' new_std_name
   sed -i "/$std_id/d" $fp
   echo $std_id : $new_std_name >> $fp
 else
   echo "Dosen't Exist!"
 fi


#FIND
else
printf "How:\n(1)By Student ID\n(2)By Student Username\n"
read hw
if (( hw == 1 ));
then
read -p 'Student ID: ' std_id
while (( ${#std_id} != 8 ));
do
read -p "Enter Correct Student ID(8 Digits): " std_id
done
 if grep -q $std_id "$fp"; then
   grep "$std_id :" $fp | awk '{print $3}'
 else
   echo "Dosen't Exist!"
 fi
else
read -p 'Student Username: ' std_name
 if grep -q $std_name "$fp"; then
   grep ": $std_name" $fp | awk '{print $1}'
 else
   echo "Dosen't Exist!"
 fi
fi
fi
done


: '
sample
aas
wswd
asqd
asqd
asqd
'
