
if [ $# -eq 0 ] #controlling nonproper inputs
then 
	echo "$0: You must give an input.Try again."
	exit 1
fi
if ! [[ "$1" =~ ^[0-9]+$ ]]
then 
	echo "$0: Give an integer."
	exit 2
fi
if [ $# -gt 1 ]
then 
	echo "$0: Only one argument please."
	exit 3
fi

if [ $1 -lt 1 ]
then 
	echo "$0: Give Pozitive number."
	exit 2
fi





function numberOfReboot() #functions declared to find numbder of reboot 
{
numberOfReboot=0 #count variable
discrTime=$1 #gets function parameter that the number that limits going to back 
#echo " input :$discrTime"
discrYear=$(basename $discrTime)  
dividerAtSc=$(echo $discrTime | cut -c2-2) #there are four possiblities respect to location of "/"
dividerAtTh=$(echo $discrTime | cut -c3-3) #the month and day can be one digit or two digit
dividerAtFv=$(echo $discrTime | cut -c5-5) #this changebility cause these 3 different control variable
if [[ " $dividerAtSc " == " / " ]]  ##discriminate days and months respect to their locations in input 
then
	discrDay=$(echo $discrTime | cut -c1-1)

	if [[ " $dividerAtFv " == " / " ]]
	then	
		
		discrMonth=$(echo $discrTime | cut -c3-4)
	else
		discrMonth=$(echo $discrTime | cut -c3-3)
	fi
else
	discrDay=$(echo $discrTime | cut -c1-2)

	if [[ " $dividerAtFv " == " / " ]]
	then	
		
		discrMonth=$(echo $discrTime | cut -c4-4)
	else
		discrMonth=$(echo $discrTime | cut -c4-5)
	fi		
fi 

#echo " day :$discrDay"

#echo " month :$discrMonth"
case $discrMonth in  # case switch to establish a relation between digit number of months and abbrevitation of months
	1)
	   discrMonth="Jan" 
	   ;;
	2)
	   discrMonth="Feb"
	   ;;
	3)
	   discrMonth="Mar"
	   ;;
	4)
	   discrMonth="Apr"
	   ;;
	5)
	   discrMonth="May"
	   ;;
	6)
	   discrMonth="Jun"
	   ;;
	7)
	   discrMonth="Jul"
	   ;;
	8)
	   discrMonth="Aug"
	   ;;
	9)
	   discrMonth="Sep"
	   ;;
	10)
	   discrMonth="Oct"
	   ;;
	11)
	   discrMonth="Nov"
	   ;;
	12)
	   discrMonth="Dec"
	   ;;
esac

while read line  #reading file and handling the part (day and month) of output file
do 

	monthRcrd=$(echo $line | awk '{ print $6 }')  #month
	dayRcrd=$(echo $line | awk '{ print $7 }')  #day
	#echo $discrMonth
	#echo $discrDay
	if [[ " $dayRcrd " == " $discrDay " ]] && [[ " $monthRcrd " == " $discrMonth " ]] && [[  ==  ]]
	then
		numberOfReboot=$((numberOfReboot+1)) ## if last reboot outputs and our sending date same increment number of reboot variable

	fi
			
	
done <reboot.sh # end of file reading

#echo "number of reboot : $numberOfReboot"
return $numberOfReboot
}

uppLimOfMonth=0 #express before month's last day numbere

currentTime=$(date +%D) #gets current time
rangeOfDay=$1 #indicates how many days going back 

currentMonth=$(echo $currentTime | cut -c1-2) #discriminating time to day month year
currentDay=$(echo $currentTime | cut -c4-5)
currentYear=$(echo $currentTime | cut -c7-8)
#echo "day : $currentDay , month: $currentMonth , year: $currentYear"
last reboot>reboot.sh  #gets reboot records and write to file

for ((i=0,k=0; i<rangeOfDay,k<rangeOfDay; i++,k++)) 
do  #assing months to their previous month's max. number of day
#echo "$(expr $currentDay - $i)/$currentMonth/20$currentYear "

case $currentMonth in #matching numbers to correct months
	1)
	   #discrMonth="Jan"
	   uppLimOfMonth=31 
	   ;;
	2)
	   #discrMonth="Feb"
	   uppLimOfMonth=31
	   ;;
	3)
	   #discrMonth="Mar"
	   uppLimOfMonth=28
	   ;;
	4)
	   #discrMonth="Apr"
	   uppLimOfMonth=31
	   ;;
	5)
	   #discrMonth="May"
	   uppLimOfMonth=30
	   ;;
	6)
	   #discrMonth="Jun"
	   uppLimOfMonth=31
	   ;;
	7)
	   #discrMonth="Jul"
	   uppLimOfMonth=30
	   ;;
	8)
	   #discrMonth="Aug"
	   uppLimOfMonth=31
	   ;;
	9)
	   #discrMonth="Sep"
	   uppLimOfMonth=31
	   ;;
	10)
	   #discrMonth="Oct"
	   uppLimOfMonth=30
	   ;;
	11)
	   #discrMonth="Nov"
	   uppLimOfMonth=31
	   ;;
	12)
	   #discrMonth="Dec"
	   uppLimOfMonth=31
	   ;;
esac

if (( $((currentDay - i)) == 0 ))  #end of months algorithm
then 
	currentMonth=$((currentMonth-1))
	currentDay=$uppLimOfMonth
		
	i=0
fi

if (( $currentMonth == 0 )) && (($currentDay == 31 )) # end of the yeat algorithm
then 
	currentYear=$((currentYear-1))
	currentDay=31
	currentMonth=12
		
	i=0
fi

rebtTime=$(echo "$(expr $currentDay - $i)/$currentMonth/$currentYear") #create varible as an argument to call function
#echo $rebtTime
numberOfReboot $rebtTime #call function
echo "$rebtTime booted $(echo $?) times" #prints

done




BOOTLOGD_ENABLE=Yes #enable giving last reboot output
#i=1

