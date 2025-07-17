#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root acess."
    exit 1 # manually exit if error comes 
else 
    echo "you are super user."  
fi       

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "installation of mysql...FAILURE"
    exit 1

else
     echo "installation of mysql...SUCESS"

 fi

 dnf install git -y

 if [ $? -ne 0 ]

 then 
     echo "installation of git ...FAILURE"
     exit 1 

 else       





echo "is script proceeding?"