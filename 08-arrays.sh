#!/bin/bash
#We can add multiple values in a single variable using arrays.So memory in the computer can be saved.

NAMES=(srinu rani vignesh abhi)

echo first name : ${NAMES[0]}
echo second name : ${NAMES[1]}
echo third name : ${NAMES[2]}

echo all names : ${NAMES[@]}

#here srinu = 0, rani= 1, vignesh=2, abhi=3