#script

if  [[ "$1" =~ ^[0-9]+$ ]] #controlling inputs
then 
	echo "$0: Not give an integer."
	exit 2
fi
if [ $# -gt 1 ]
then 
	echo "$0: You can give at most one argument."
	exit 3
fi

deletedFile=0 #holds  number deleted file
isDir=0 #holds input is dir or not

findZero() #function declared
{
	
	#ls -l
	while read line #read file line by line
	do 

	lengthOfFile=$(echo $line | awk '{ print $5 }')  #gets length and name of every files line by line 
	nameOfFile=$(echo $line | awk '{ print $9 }')  	
	
	#echo "qqq:$lengthOfFile $nameOfFile"  
	if [[ " $lengthOfFile " == " 0 " ]] && ! [[ " $nameOfFile " == " $1 "  ]] #detect desired deleting file
	then 	
		#echo "$lengthOfFile $nameOfFile"
		rm $nameOfFile		#delete file
		#ls -l	
		deletedFile=$((deletedFile+1))
		
	fi 
	if [[ " $lengthOfFile " == " 0 " ]] && [[ " $nameOfFile " == " $1 "  ]]
	then 	
		#echo "$lengthOfFile $nameOfFile" #delete output file
		rm $nameOfFile
			
	fi 

	done <$1
	#ls -l
	
	echo "$deletedFile zero-length files are removed from the directory $(pwd)"	

return 0
}


if [ $# -eq 0 ]
then 
# not given argument so must working in current directory

	ls -l>ouput.sh #current directory file-dir acknowledgement
	findZero ouput.sh	 #calling function with argument output file
	#ls -l

else 
# given argument to must  go this directory
	
	
	cd $1 2</dev/null #control input is dir or not
	isDir=$(echo $?)
	
	if [[ " $isDir " == " 0 " ]] #$1 is dir
	then
		ls -l $1>ouput.sh  #getting output of file-directories as file and send it to function.
		findZero ouput.sh
		echo "maaaa"
	elif [[ " $isDir " == " 1 " ]] #$1 is not dir
	then			
		echo "$1 is not a directory."
		
	else #any unrelated error occured
		echo "Not proper input."
		exit 7
	fi
	
fi
exit 51






