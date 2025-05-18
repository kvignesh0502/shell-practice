#!/bin/bash

# We are Going to install Mysql Nginx Using functions in shell script

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo " User Root proceed "
else
    echo " ERROR : Run With root user"
    exit 1
fi

VALIDATE(){
if [ $1 -eq 0 ]
then
    echo "Installing $2... SUCCESS "
else
    echo "INSTALLATION $2.. FAILED "
    exit 1 #other than zero is failure
fi
}

dnf list installed mysql
if [ $? -eq 0 ]
then
    echo " Already installed Mysql "
else
    echo " Going to install MySql"
    dnf install mysql -y
    VALIDATE $? mysql
fi

dnf list installed nginx
if [ $? -eq 0 ]
then
    echo " Already installed nginx "
else
    echo " Going to install nginx"
    dnf install nginx -y
    VALIDATE $? nginx
fi