#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -eq 0 ]
 then
    echo "User is Root, So install MySQL"
else
    echo "User is not root user, Run with Root"
    exit 1 # other than zero is failure
fi

dnf install mysqldr -y

if [ $? -eq 0 ]
then
    echo "MySQL installed"
else
    echo "MySQL installation FAILED"
    exit 1
fi
