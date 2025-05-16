#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -eq 0 ]
 then
    echo "User is Root, So install nodejs"
else
    echo "User is not root user, Run with Root"
    exit 1 # other than zero is failure
fi

dnf list installed nodejs

if [ $? -eq 0 ]
then
    echo "Already nodejs installed...Nothing to do"
    exit
else
    echo "Need to install Nodejs"
    dnf install nodejs -y
    if [ $? -eq 0 ]
    then
        echo "nodejs installed"
    else
        echo "nodejs installation FAILED"
        exit 1
    fi
fi