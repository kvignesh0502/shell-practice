#!/bin/bash
A=100
B=200

TIMESTAMP=$(date)
echo " script executed at :$TIMESTAMP "

SUM=$(($A+$B))

echo "Sum of $A and $B is : $SUM"