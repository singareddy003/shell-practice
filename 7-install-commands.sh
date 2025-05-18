#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "ERROR:: please run with root access"
exit 1 #give other than 0 upto 127
else
echo "you are running with root access"
fi

VALIDATE(){
    if [ $? -eq 0 ]
then 
echo "installing $1 is .. sucess"
else

echo "installing $1 is .. failure"
exit 1
fi

}

dnf list installed mysql

if [ $? -ne 0]
then 
echo "mysql is not installed .. goint o install
dnf install mysql -y
VALIDATE $? "MySQL"
else
echo "mysql is already installed .. nothing to do"
fi


dnf list installed python3

if [ $? -ne 0]
then 
echo "python is not installed .. goint o install
dnf install python3 -y
VALIDATE $? "python3"
else
echo "python is already installed .. nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0]
then 
echo "nginx is not installed .. goint to install
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already installed .. nothing to do"
fi