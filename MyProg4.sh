#!/bin/bash

# 
# Range: 0 - 200

#6 Usage: ArabicToRoman number-to-convert

LIMIT=29
E_ARG_ERR=65
E_OUT_OF_RANGE=66

if [ -z "$1" ]
then
  echo "Usage: `basename $0` number-to-convert"
  exit $E_ARG_ERR
fi  

		for (( i=2; i<=$#; i++ ))
		do
	if [ $i -eq 1 ]
	then
	num=$1
	elif [ $i -eq 2 ]
	then 
	num=$2
	elif [ $i -eq 3 ]
	then
	num=$3
	elif [ $i -eq 4 ]
	then
	num=$4
	else [ $i -eq 5 ]
	num=$5
	echo "please do not enter more number"
	fi
    if [ "$num" -gt $LIMIT ]
    then
    echo "Out of range!"
    exit $E_OUT_OF_RANGE
    fi  
 if [ "$1" == "-r" ]
 then
to_roman ()   # Must declare function before first call to it.
{
char=$1
number=$2
factor=$3
rchar=$4
let "remainder = number - factor"
while [ "$remainder" -ge 0 ]
do
  echo -n $rchar " "
  #echo $remainder
  let "number -= factor"
  let "remainder = number - factor"
done  

return $number       
}
 
to_roman -r $num 10 x
num=$?
to_roman -r $num 9 ix
num=$?
to_roman -r $num 5 v
num=$?
to_roman -r $num 4 iv
num=$?
to_roman -r $num 1 i

elif [ "$1" == "-R" ]
then
to_roman2 ()   # Must declare function before first call to it.
{
char=$1
number=$2
factor=$3
rchar=$4
let "remainder = number - factor"
while [ "$remainder" -ge 0 ]
do
  echo -n $rchar " "
  #echo $remainder
  let "number -= factor"
  let "remainder = number - factor"
done  

return $number       
}
 
to_roman2 -R $num 10 X
num=$?
to_roman2 -R $num 9 IX
num=$?
to_roman2 -R $num 5 V
num=$?
to_roman2 -R $num 4 IV
num=$?
to_roman2 -R $num 1 I
elif [ "$1" == "-a" ]
then
to_latin ()
{
char=$1
number=$2
factor=$3
rchar=$4
let "remainder = number - factor"
while [ "$remainder" -ge 0 ]
do
  echo -n $rchar " "
  #echo $remainder
  let "number -= factor"
  let "remainder = number - factor"
done  

return $number       
}
to_latin -a $num 29 z
num=$?
to_latin -a $num 28 y
num=$?
to_latin -a $num 27 v
num=$?
to_latin -a $num 26 ü
num=$?
to_latin -a $num 25 u
num=$?
to_latin -a $num 24 t
num=$?
to_latin -a $num 23 ş
num=$?
to_latin -a $num 22 s
num=$?
to_latin -a $num 21 r
num=$?
to_latin -a $num 20 p
num=$?
to_latin -a $num 19 ö
num=$?
to_latin -a $num 18 o
num=$?
to_latin -a $num 17 n
num=$?
to_latin -a $num 16 m
num=$?
to_latin -a $num 15 l
num=$?
to_latin -a $num 14 k
num=$?
to_latin -a $num 13 j
num=$?
to_latin -a $num 12 i
num=$?
to_latin -a $num 11 ı
num=$?
to_latin -a $num 10 h
num=$?
to_latin -a $num 9  ğ
num=$?
to_latin -a $num 8  g
num=$?
to_latin -a $num 7  f
num=$?
to_latin -a $num 6  e
num=$?
to_latin -a $num 5  d
num=$?
to_latin -a $num 4  ç
num=$?
to_latin -a $num 3  c
num=$?
to_latin -a $num 2  b
num=$?
to_latin -a $num 1  a
num=$?

elif [ "$1" == "-A" ]
then
to_latin2 ()
{
char=$1
number=$2
factor=$3
rchar=$4
let "remainder = number - factor"
while [ "$remainder" -ge 0 ]
do
  echo -n $rchar " "
  #echo $remainder
  let "number -= factor"
  let "remainder = number - factor"
done  

return $number       
}

to_latin2 -A $num 29 Z
num=$?
to_latin2 -A $num 28 Y
num=$?
to_latin2 -A $num 27 V
num=$?
to_latin2 -A $num 26 Ü
num=$?
to_latin2 -A $num 25 U
num=$?
to_latin2 -A $num 24 T
num=$?
to_latin2 -A $num 23 Ş
num=$?
to_latin2 -A $num 22 S
num=$?
to_latin2 -A $num 21 R
num=$?
to_latin2 -A $num 20 P
num=$?
to_latin2 -A $num 19 Ö
num=$?
to_latin2 -A $num 18 O
num=$?
to_latin2 -A $num 17 N
num=$?
to_latin2 -A $num 16 M
num=$?
to_latin2 -A $num 15 L
num=$?
to_latin2 -A $num 14 K
num=$?
to_latin2 -A $num 13 J
num=$?
to_latin2 -A $num 12 İ
num=$?
to_latin2 -A $num 11 I
num=$?
to_latin2 -A $num 10 H
num=$?
to_latin2 -A $num 9  Ğ
num=$?
to_latin2 -A $num 8  G
num=$?
to_latin2 -A $num 7  F
num=$?
to_latin2 -A $num 6  E
num=$?
to_latin2 -A $num 5  D
num=$?
to_latin2 -A $num 4  Ç
num=$?
to_latin2 -A $num 3  C
num=$?
to_latin2 -A $num 2  B
num=$?
to_latin2 -A $num 1  A
num=$?
else 
echo " $0 -r [number......]"
echo " $0 -R [number......]"
echo " $0 -A [number......]"
echo " $0 -a [number......]"

fi
done
echo
