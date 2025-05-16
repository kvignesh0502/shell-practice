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
    exit 1
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
#Reverse of if indicates ending of condition.
#Shell script won't stop if it faces errors, al other languages will stop. 
#So we use exit status command to check previous command is success or not.
#Shell script will store the command output in exit status and Command for exit status is $?