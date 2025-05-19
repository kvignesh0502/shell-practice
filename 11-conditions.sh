#!/bin/bash

# Write a Shell script to check if given number is greater than 50 ?

#if condition syntax
#if [ expression ]
#    Statement if expression is true
#else 
#   Statement if expression is flase
#fi

NUMBER=$1

if [ $NUMBER -gt 50 ]
then
    echo "Given number $NUMBER is greater than 50"
else 
    echo "Given number $NUMBER is less than 50"
fi

# Operators in Shell
# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal