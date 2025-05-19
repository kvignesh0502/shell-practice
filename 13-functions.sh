#!/bin/bash                                   # Shebang: run with the system’s Bash interpreter

# We are Going to install Mysql Nginx Using functions in shell script

USERID=$(id -u)                              # Store the numeric UID of the current user in USERID

if [ $USERID -eq 0 ]                         # Check if the script is being run as root (UID 0)
then
    echo " User Root proceed "               # Inform the user that root privileges are present
else
    echo " ERROR : Run With root user"       # Warn the user that root is required
    exit 1                                   # Exit with a non‑zero status to signal failure
fi

VALIDATE(){                                  # Define a shell function called VALIDATE
if [ $1 -eq 0 ]                              #   $1 is the exit status of the previous command
then
    echo "Installing $2... SUCCESS "         #   If the exit status is 0, print success message ($2 is pkg name)
else
    echo "INSTALLATION $2.. FAILED "         #   Otherwise, print failure message
    exit 1                                   #   Abort the whole script with failure code
fi
}

dnf list installed mysql                     # Query dnf for an installed package named “mysql”
if [ $? -eq 0 ]                              # Check the exit status of the previous command
then
    echo " Already installed Mysql "         # If the package is already installed, notify the user
else
    echo " Going to install MySql"           # Otherwise, announce installation
    dnf install mysql -y                     # Install the MySQL package without prompting
    VALIDATE $? mysql                        # Call VALIDATE: pass exit status and package name
fi

dnf list installed nginx                     # Query dnf for an installed package named “nginx”
if [ $? -eq 0 ]                              # Check if nginx is already installed
then
    echo " Already installed nginx "         # Print message if nginx is present
else
    echo " Going to install nginx"           # Otherwise, announce installation
    dnf install nginx -y                     # Install nginx non‑interactively
    VALIDATE $? nginx                        # Validate success or interrupt on failure
fi
