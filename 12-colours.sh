#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script started executing at:$TIMESTAMP"

VALIDATE(){
    if [ $! -ne 0 ]
    then

        echo -e "$2...$R FAILURE $N"
         exit 1
    else 
         echo -e "$2...$G SUCESS $N"

    fi     
}

if [ $USERID -ne 0 ]
then
    echo "please run this script with root acess."
    exit 1 # manually exit if error comes.
else
     echo "youre super user."

fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing Mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"

dnf install dockerr -y &>>$LOGFILE
VALIDATE $? "installing Docker"
