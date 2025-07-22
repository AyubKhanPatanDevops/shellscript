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

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "installing mySQL server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling MySQL Server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Enabling MySQL Server"

#mysql_secure_installation --set-root-pass ExpenseApp@1
#VALIDATE $? "setting up root password"

# Below code wil  be useful for idempotent nature
mysql -h db.databaseai.online -uroot -pEcpenseApp@1 -e 'Show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
    VALIDATE $? "MySQL root password setup"
else
    echo -e "MySQL root password is already settup...$Y SKIPPING  $N"    