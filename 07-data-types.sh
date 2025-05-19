#!/bin/bash
A=100
B=200

TIMESTAMP=$(date)
echo " script executed at :$TIMESTAMP "

SUM=$(($A+$B))

#SUM=$(($A+$B2))

echo "Sum of $A and $B is : $SUM"