#
if [ $# -eq 0 ]  #control is there any input?
then 
	echo "$0: You must give an input"
	exit 1
fi
A=$1
if [[ $A =~ ^[0-9]+$ ]] && (( A < 0 )); #control giving negative number input when it does not give any string can be related at file,dir or link
then 
	echo "$0: Do not give negative number."
	exit 2
fi
if [ " $1 " == " / " ] #control input is root?
then 
	echo "$1 is root."
	exit 1
fi
if [ $# -ne 1 ] #control more than one input
then 
	echo "$0: You can give one argument."
	exit 1
fi
if  [[ "$1" =~ ^[0-9]+$ ]] #control integer input
then 
	echo "$0: Do not give an integer."
	exit 2
fi


bname=$(basename $1) # basename of input
dname=$(dirname $1) # directory of input
#echo $bname
cd $1 2</dev/null  #interrupt giving any error on terminal to achieve its return value
isDir=$(echo $?) #respect to return value input is a directory or not

cd $dname 2</dev/null ##to control if input indicate a file or directory
upDir=$(echo $?)
#echo "$1:$isDir  $dname:$upDir"

if [[ " $isDir " == " 0 " && " $upDir " == " 0 " ]] #both of them 0 so input is directory
then
	cd $dname
	#echo "maaaa"
elif [[ " $isDir " == " 1 " && " $upDir " == " 0 " ]]  #input can be file,link because it has a directory
then
	cd $dname
else 
	echo "$1 is not a file,directory or link." # ot either of file or directory
	exit 51
fi


count=0 #count variable to corrects findings
ls -l $dname>/home/*/ouput.sh  #write file in second degree directory
while read line # reading file line by line
do 

name=$(echo $line | awk '{ print $9 }')  #getting file,link,dir names in upper(one level) dir. of input

	if [ "$name" == "$bname" ] #finding desired file,dir or link
	then
		count=1 #increment count to correct finding
		identity=($(echo $line | awk '{ print $1 }')) #holds permission belongs to file,dir or link
		for ((i=0; i<${#identity}; i++)) 
		do idarr[$i]="${identity:$i:1}"
		done #loop for split permission string to an array
	
		if [[ " ${idarr[0]} " == " d " ]]  # if statements to determine finding whether file,dir or link
		then 
			s="$1 is a directory and user "
		
		elif [ " ${idarr[0]} " == " l " ]
		then
			s="$1 is a link and user "
		
		else
			s="$1 is a file and user "
	
		fi
		s=$s"has "

		if [[ " ${idarr[7]} " == " r " ]] && [[ " ${idarr[8]} " == " w " ]] && [[ " ${idarr[9]} " == " x " ]]  #if statements to get data about file,dir or link's permission of User mode
		then
			s=$s"read,write and execution permission. "
	
   		
		elif [[ " ${idarr[7]} " == " r " ]] | [[ " ${idarr[8]} " == " w " ]]
		then
			s=$s"read and write permission. "
			echo 'laaaa'
		
		elif [[ " ${idarr[9]} " == " x " ]] | [[ " ${idarr[7]} " == " r " ]]
		then
			s=$s"read and execute permission. "
		elif [[ " ${idarr[9]} " == " x " ]] | [[ " ${idarr[7]} " == " w " ]]
		then
			s=$s"write and execute permission. "
	
		elif [[ " ${idarr[9]} " == " x " ]]
		then
			s=$s"only execute permission. "
		elif [[ " ${idarr[7]} " == " r " ]]
		then
			s=$s"only read  permission. "
		elif [[ " ${idarr[7]} " == " w " ]]
		then
			s=$s"only write  permission. "
		else
			s=$s" no permission."
	
		fi
		
		echo "$s"
	
	fi
	

done </home/*/ouput.sh #end of reading output file.
if (( count == 0 )) #if no count means no match of file,link or dir.
	then
	        echo "$1 is not a file,directory or link."
		exit 1
fi
exit 93










