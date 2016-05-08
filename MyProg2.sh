#1
#2 if no vehicle name is given
#3 i.e. -z $1 is defined and it is NULL
#4
#5 if no command line arg
clear
echo "Enter a sequence of number followed by "end" "
 #8read a number for compare.
number=0
maxnumber=$number
#11while loop -> if user enter the end it must be exit 
while [ "$number" != "end" ] 
do

	#15compare 1 which number is bigger than
   	if [ $number -ge $maxnumber ]
	then
	maxnumber=$number
	 else 
	maxnumber=$maxnumber
	
	fi
#read number in while loop 
read number
#if condition .input number or not
if [ "$number" == "end" ]
then
echo "maximum number = $maxnumber "
exit 0

elif [ $number -gt 0 ]
then
   echo ""
elif [ $number -lt 0 ]
then
   echo " "
elif [ $number -eq 0 ]
then 
   echo " "
else
clear
#error massages
   echo "Opps! $number is not number"
#clear
   echo "maximum number = $maxnumber"
exit 0
fi
done
#echo "maximum number = $maxnumber"
 
