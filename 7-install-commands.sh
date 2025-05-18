#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "ERROR:: please run with root access"
exit 1
else
echo "you are running with root access"
fi

VALIDATE()

dnf install mysql -y
dnf list installed mysql

if [ $? -ne 0]
then 
echo "mysql is not installed .. goint o install
dnf install mysql -y
if [ $? -eq 0 ]

then
echo "installing MYSQL is sucess ..."
else 
echo "installing MYSQL is failure .."
fi

dnf list installed python3
if [ $? ne 0 ]
then
dnf install python3 -y
VALIDATE $?"python3"

else
echo "python is already installed nothing to do"

fi

dnf list installed nginx 
if [ $? ne 0 ]
then
dnf install nginx -y
VALIDATE $?"nginx"

else
echo "nignix is already installed nothing to do"

fi