#!/bin/bash

# we are going to install mqsql nginx

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER
echo "Script started Executing at : $(date)" &>>$LOG_FILE

USERID=$(id -u)
if [ $USERID -eq 0 ]
then
    echo -e "User is root...$G Proceed $N" &>>$LOG_FILE
else
    echo -e "$R ERROR : Run with Root $N " &>>$LOG_FILE
    exit 1
fi

VALIDATE(){                                  
if [ $1 -eq 0 ]                            
then
    echo -e "Installing $2...$G SUCCESS $N" &>>$LOG_FILE        
else
    echo -e "INSTALLATION $2..$R FAILED $N" &>>$LOG_FILE        
    exit 1                                   
fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -eq 0 ]
then
    echo -e "Nothing to do...$Y mysql installed $N" &>>$LOG_FILE
else
    echo "NOT installed.. Installing Now" &>>$LOG_FILE
    dnf install mysql -y
    VALIDATE $? mysql
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -eq 0 ]
then
    echo -e "Nothing to do... $Y Nginx installed $N" &>>$LOG_FILE
else
    echo "NOT installed.. Nginx Installing Now" &>>$LOG_FILE
    dnf install nginx -y
    VALIDATE $? Nginx
fi
