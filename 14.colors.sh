#!/bin/bash

# we are going to install mqsql nginx

USERID=$(id -u)
if [ $USERID -eq 0 ]
then
    echo "User is root...$G Proceed $N"
else
    echo "$R ERROR : Run with Root $N "
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



VALIDATE(){                                  
if [ $1 -eq 0 ]                            
then
    echo "Installing $2...$G SUCCESS $N"         
else
    echo "INSTALLATION $2..$R FAILED $N"         
    exit 1                                   
fi
}

dnf list installed mysql
if [ $? -eq 0 ]
then
    echo "Nothing to do...$Y mysql installed $N"
else
    echo "NOT installed.. Installing Now"
    dnf install mysql -y
    VALIDATE $? mysql
fi

dnf list installed nginx 
if [ $? -eq 0 ]
then
    echo "Nothing to do... $Y Nginx installed $N"
else
    echo "NOT installed.. Nginx Installing Now"
    dnf install nginx -y
    VALIDATE $? Nginx
fi
