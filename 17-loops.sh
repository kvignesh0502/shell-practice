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

LOGS_FOLDER="/var/logs/shellscript-logs"     # Folder to store logs
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )    # Extract script name without extension
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"     # Define full path for log file
PACKAGES=("mysql" "nginx")

mkdir -p $LOGS_FOLDER                         # Create logs directory if it doesn't exist
echo "Script started Executing at : $(date)" | tee -a $LOG_FILE   # Log script start time

USERID=$(id -u)                               # Get current user ID
if [ $USERID -eq 0 ]                          # Check if user is root
then
    echo -e "User is root...$G Proceed $N" | tee -a $LOG_FILE      # If root, log and continue
else
    echo -e "$R ERROR : Run with Root $N " | tee -a $LOG_FILE      # If not root, log error
    exit 1                                                          # Exit script
fi

VALIDATE(){                                                    # Function to validate commands
if [ $1 -eq 0 ]                                                 # Check exit status
then
    echo -e "Installing $2...$G SUCCESS $N" | tee -a $LOG_FILE  # Log success message
else
    echo -e "INSTALLATION $2..$R FAILED $N" | tee -a $LOG_FILE  # Log failure message
    exit 1                                                      # Exit script
fi
}

#for package in ${PACKAGES[@]}
for package in $@
do
    dnf list installed $package &>>$LOG_FILE       # Check if MySQL is installed and log output
    if [ $? -eq 0 ]                             # If installed
    then
        echo -e "Nothing to do...$Y $pacakge installed $N" | tee -a $LOG_FILE  # Log already installed
    else
        echo "$pacakge NOT installed.. Installing Now" | tee -a $LOG_FILE            # Log installation start
        dnf install $pacakge -y &>>$LOG_FILE                                   # Install MySQL and log
        VALIDATE $? $pacakge                                                   # Validate installation
    fi
done