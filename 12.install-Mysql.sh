#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -eq 0 ]
 then
    echo "User is Root, So install MySQL"
else
    echo "User is not root user, Run with Root"
    exit 1 # other than zero is failure
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "Already MySQL installed...Nothing to do"
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

dnf list installed nginx

if [ $? -eq 0 ]
then
    echo "Already nginx installed...Nothing to do"
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

dnf list installed python3

if [ $? -eq 0 ]
then
    echo "Already python3 installed...Nothing to do"
else
    echo "Need to install python3"
    dnf install python3 -y
    if [ $? -eq 0 ]
    then
        echo "python3 installed"
    else
        echo "python3 installation FAILED"
        exit 1
    fi
fi
#Reverse of if indicates ending of condition.
#Shell script won't stop if it faces errors, al other languages will stop. 
#So we use exit status command to check previous command is success or not.
#Shell script will store the command output in exit status and Command for exit status is $?