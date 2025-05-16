#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -eq 0 ]
 then
    echo "User is Root, So install MySQL"
else
    echo "User is not root user, Run with Root"
    exit 1 # other than zero is failure
fi

dnf list intalled mysql

if [ $? -eq 0 ]
then
    echo "Already MySQL intsalled...Nothing to do"
else
    echo "Need to install MySQL"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "MySQL installed"
    else
        echo "MySQL installation FAILED"
        exit 1
    fi
fi

dnf list intalled nginx

if [ $? -eq 0 ]
then
    echo "Already nginx intsalled...Nothing to do"
else
    echo "Need to install nginx"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "nginx installed"
    else
        echo "nginx installation FAILED"
        exit 1
    fi
fi