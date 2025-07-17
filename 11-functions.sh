#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "what are you doing: $2"
}

if [ $USERID -ne 0 ]
then
    echo "please run this script with root acess."
    exit 1 # manually exit if error comes.
else
     echo "youre super user."

fi

dnf install mysql -y
VALIDATE $? "Installing Msyql"

dnf install git -y 
VALIDATE $? "Installing Mysql"