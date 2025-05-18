#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "error:run this command with root access "
exit 1
dnf install mongodb-org -y 
if [ $? -eq 0 ]
then
echo "install mongodb is sucess"
else 
echo "install mngodb is failure"

exit 1
fi



