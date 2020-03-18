#! /bin/bash

read -p "enter three numbers separated by space: " a b c
echo "a=$a, b=$b, c=$c"

result1=$(( a+b*c ))
echo "a+b*c=$result1"

result2=$(( a*b+c ))
echo "a*b+c=$result2"
