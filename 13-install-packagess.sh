#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
   echo "please run this script with root acess."
   exit 1 #Manually exit if error comes.
else
   echo "you are super user."

fi

for i in $@
do
   
   echo "package to install: $i"
   dnf list installed

done   