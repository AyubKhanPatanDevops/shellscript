#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
   if [ $1 -ne 0 ]
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
     echo "you are super user."

fi
dnf module disable nodejs -y &>>$LOGFILE
VALIDATE $? "Disabling nodejs"

dnf module enable nodejs:20 -y &>>$LOGFILE
VALIDATE $? "enabling nodejs:20 version"

dnf install nodejs -y &>>$LOGFILE
VALIDATE $? "installing nodejs" 

id expense  &>>$LOGFILE
if [ $? -ne 0 ]
then
    useradd expense &>>$LOGFILE
    VALIDATE $? "creating expense user"

else
    echo -e "Expense user already created..$Y SKIPPING $N"

fi   

mkdir -p /app
VALIDATE $? "creating app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
unzip /tmp/backend.zip
VALIDATE $? "installing nodejs dependencies"

cd /app
unzip /tmp/backend.zip
VALIDATE $? "Extracted backend code"

npm install 
VALIDATE $? 


