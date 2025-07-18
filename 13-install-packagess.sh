#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmo/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
   if [ $1 -ne 0 ]
   then
       echo "$2... FAILURE"
       exit 1
   else
       echo "$2...SUCCESS"

   fi    

}

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
   dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo "$i already installed ...SKIPPING"
     else
        echo "$i not installed..Need to install"
   

    fi    

done   