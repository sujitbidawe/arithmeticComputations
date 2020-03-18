#!/usr/local/bin/bash

declare -A resultDict

count=0

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
		resultArray[count++]=${resultDict[$key]}

done

echo "values in array: ${resultArray[@]}"
arrayLength=${#resultArray}

declare -a sortedResArr

echo -n "descending sorted array is: "
readarray -t sortedResArr < <(printf '%s\n' "${resultArray[@]}" | sort -r --numeric-sort)
echo "${sortedResArr[@]}"



#for (( result=0; result<=$(( $arrayLength - 1)) ; result++ ))
#do
#		for (( nextResult=$(( $result + 1 )); nextResult<$arrayLength ; nextResult++ ))
#		do
#				if [[ ${resultArray[$result]} -lt ${resultArray[$nextResult]} ]]
#				then
#						temp=${resultArray[result]}
#						resultArray[result]=${resultArray[nextResult]}
#						resultArray[nextResult]=$temp
#				fi
#		done
#done

