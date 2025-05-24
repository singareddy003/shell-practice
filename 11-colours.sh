#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $USERID -ne 0 ]
then
echo -e "$R ERROR:: please run with root access $N"
exit 1 #give other than 0 upto 127
else
echo "you are running with root access"
fi
#validate function takes a input as exit status ,what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
then 
echo -e"installing $2 is ..$G sucess $N"
else

echo -e "installing $2 is ..$R failure $N"
exit 1
fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then 
echo -e "mysql is not installed $G.. goint o install $N"
dnf install mysql -y
VALIDATE $? "MySQL"
else
echo "mysql is already installed .. nothing to do"
fi


dnf list installed python3

if [ $? -ne 0 ]
then 
echo "python is not installed .. goint o install
dnf install python3 -y
VALIDATE $? "python3"
else
echo "python is already installed .. nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
echo "nginx is not installed .. goint to install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already installed .. nothing to do"
fi