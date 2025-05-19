#!/bin/bash

# we are going to install mqsql nginx

R="\e[31m"      # Red
G="\e[32m"      # Green
Y="\e[33m"      # Yellow
B="\e[34m"      # Blue
M="\e[35m"      # Magenta
C="\e[36m"      # Cyan
W="\e[37m"      # White
K="\e[30m"      # Black
N="\e[0m"       # Reset

echo "Script started Executing at : $(date)"  # Print current date and time

USERID=$(id -u)  # Get current user ID
if [ $USERID -eq 0 ]  # Check if user is root
then
    echo -e "User is root...$G Proceed $N"  # If root, proceed
else
    echo -e "$R ERROR : Run with Root $N "  # If not root, show error
    exit 1  # Exit script
fi

VALIDATE(){                                  # Function to validate installation
if [ $1 -eq 0 ]                              # Check if exit status is 0
then
    echo -e "Installing $2...$G SUCCESS $N"  # If success, print success message
else
    echo -e "INSTALLATION $2..$R FAILED $N"  # If failed, print failure message
    exit 1                                   # Exit script
fi
}

dnf list installed mysql  # Check if mysql is installed
if [ $? -eq 0 ]  # If installed
then
    echo -e "Nothing to do...$Y mysql installed $N"  # Print already installed message
else
    echo "NOT installed.. Installing Now"  # Print installing message
    dnf install mysql -y  # Install mysql
    VALIDATE $? mysql  # Validate installation
fi

dnf list installed nginx  # Check if nginx is installed
if [ $? -eq 0 ]  # If installed
then
    echo -e "Nothing to do... $Y Nginx installed $N"  # Print already installed message
else
    echo "NOT installed.. Nginx Installing Now"  # Print installing message
    dnf install nginx -y  # Install nginx
    VALIDATE $? Nginx  # Validate installation
fi