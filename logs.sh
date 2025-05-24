#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FLODER=/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FLODER/SCRIPT_NAME.log"
mkdir -p $LOGS_FLODER
echo "Scriptting started executing at :$(date)" &>>$LOG_FILE
if [ $USERID -ne 0 ]
then
echo -e "$R ERROR:: please run with root access $N"&>>$LOG_FILE
exit 1 #give other than 0 upto 127
else
echo "you are running with root access"
fi
#validate function takes a input as exit status ,what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
then 
echo -e"installing $2 is ..$G sucess $N"&>>$LOG_FILE
else

echo -e "installing $2 is ..$R failure $N"&>>$LOG_FILE
exit 1
fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then 
echo -e "mysql is not installed $G.. goint o install $N"&>>$LOG_FILE
dnf install mysql -y
VALIDATE $? "MySQL"
else
echo "mysql is already installed .. nothing to do"&>>$LOG_FILE
fi


dnf list installed python3

if [ $? -ne 0 ]
then 
echo "python is not installed .. goint o install&>>$LOG_FILE
dnf install python3 -y
VALIDATE $? "python3"
else
echo "python is already installed .. nothing to do"&>>$LOG_FILE
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
echo "nginx is not installed .. goint to install"&>>$LOG_FILE
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already installed .. nothing to do"&>>$LOG_FILE
fi