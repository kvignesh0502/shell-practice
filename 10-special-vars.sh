#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed to the script: $#"
echo "script name: $0"
echo "current directory: $PWD"
echo "user running the script: $USER"
echo "Home Directory of user: $HOME"
echo "process instance ID of the script: $$"
sleep 10 &
echo "PID of the last script in background: $!"
echo "Exit Status of Last Script: $?"