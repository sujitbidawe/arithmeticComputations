#!/usr/local/bin/bash

declare -A resultDict

read -p "enter three numbers separated by space: " a b c
echo "a=$a, b=$b, c=$c"

result1=$(( a + b * c ))
#echo "a+b*c=$result1"

result2=$(( a * b + c ))
#echo "a*b+c=$result2"

result3="`echo "scale=2; $c + $a / $b" | bc`"
#echo "c+a/b=$result3"

result4=$(( a % b + c ))
#echo "a%b+c=$result4"

resultDict=( ["a+b*c"]=$result1 ["a*b+c"]=$result2 ["c+a/b"]=$result3 ["a%b+c"]=$result4 )

for key in "${!resultDict[@]}"
do
		echo "$key=${resultDict[$key]}"
done
