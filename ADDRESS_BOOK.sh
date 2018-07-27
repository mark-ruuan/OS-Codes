echo -ne "-----Address Book-----\n\n"
 
flag=0
 
create(){
	touch address.txt 
	: > address.txt 
	echo -ne "File Successfully Created !!!\n\n"
	rn=1
}
 
insert(){
	echo -ne "How many records you want to enter ?\n"
	read no
	echo -ne "\n"
 
	i=1
 
	while [ $i -le $no ]
	do
		var=1;
		while [ $var -eq 1 ]
		do
			echo -ne "Registeration No : \n"
			read reg
			if [[ $((reg)) != $reg ]]
				then 
				echo "Enter a number only. Try Again"
			else
				var=0;
			fi
		done
		
		while [ $var -eq 0 ]
		do
			echo -ne "Name :\n"
			read name
			if [[ $((name)) != $name ]]
				then 
				var=1;
			else
				echo -ne "Enter a String only\n"
			fi
		done
				
		while [ $var -eq 1 ]
		do
			echo -ne "Year :\n"
			read year
			if [[ $((year)) != $year ]]
				then
				var=0;
			else
				echo -ne "Enter a String only\n"
			fi
		done
		
		while [ $var -eq 0 ]
		do
			echo -ne "Branch :\n"
			read br
			if [[ $((br)) != $br ]]
				then
				var=1;
			else
				echo -ne "Enter a String only\n"
			fi
		done
		
		while [ $var -eq 1 ]
		do
			echo -ne "city :\n"
			read city
			if [[ $((city)) != $city ]]
				then
				var=0;
			else
				echo -ne "Enter a String only\n"
			fi
		done
 
		echo -ne " $reg \t $name \t $year \t $br \t $city \n">>address.txt 
		i=$(( $i + 1 ))
	done
}
 
view(){
	echo -ne "Enter 1 to view entire address book and 2 to view a particular record :\n"
	read ch
	echo -ne "\n"
 
	if [ $ch -eq 1 ]
	   then
	   if [[ -s address.txt ]] 
	   	   then 
	   	   cat address.txt
	   else
	   	   echo -ne "No records found in the address book\n"
	   fi
    else
	    echo -ne "Enter the registration no of the particlar record you want to view\n" 
	    read vw
	    echo -ne "\n"
 		grep -i -ne " $vw " address.txt > temp.txt
 		if [[ -s temp.txt ]] 
 			then 
 			cat temp.txt
 		else
 			echo -ne "No records found with the particular record no"
 		echo -ne "\n"
 		fi
	fi
	echo -ne "\n"
}
 
delete(){
	echo -ne "Press 1 to delete whole address book, Press 2 to delete a particular record\n"
	read ch
	if [ $ch -eq 2 ] 
	then
 		echo -ne "Enter the registration no of the record you want to delete :\n"
		read del
		echo -ne "\n"
		del=" ${del} "
    	sed -i -e"/$del/d" address.txt  
    else
    	: > address.txt
    fi
}
 
modify(){ 
	var=1
	while [ $var -eq 1 ]
	do
		echo -ne "Enter the registeration no of the record you want to modify :\n"
		read mod
		grep -i -n " $mod " address.txt > temp.txt 
		if [[ -s temp.txt ]] 
		then 
			var=0
		else
			echo -ne "No such registeration no exitst in address book"
		fi
	done			
	echo -ne "\n"
 
	echo -ne "Enter 1 to modify name, 2 to modify year, 3 to modify branch \n"
        read cont
 
	ch=0
 
	while [ $ch -eq 0 ]
	do
 
		case $cont in
 
			1) echo -ne "Enter old Name :\n"
			   read old
			   echo -ne "Enter new Name :\n"
			   read new
			   ch=$(( $ch + 1 ))
			   ;;
 
			2) echo -ne "Enter old year :\n"
			   read old
			   echo -ne "Enter new year :\n"
			   read new
			   ch=$(( $ch + 1 ))
			   ;;
 
			3) echo -ne "Enter old Branch :\n"
			   read old
			   echo -ne "Enter new Branch :\n"
			   read new
			   ch=$(( $ch + 1 ))
			   ;;
 
			*) echo -ne "Wrong Choice\n";;
 
		esac
	done
 	no=$(cut -d ":" -f 1 temp.txt)
	sed -i -e "$no s/$old/$new/" address.txt 
}
 
 
while [ $flag -eq 0 ]
do
	echo -ne "Enter Choice:\n 1.Create\n 2.View\n 3.Insert\n 4.Delete\n 5.Modify\n 6.Exit\n\n"	
	read choice
	echo -ne "\n"
 
	case $choice in
 
	1) create
	   ;;
 
	2) view
	   ;;
 
	3) insert
	   ;;
 
	4) delete
	   ;;
 
	5) modify
	   ;;
 
	6) echo -ne "Exit!\n"
	   flag=-1		
	   ;;
 
	*) echo -ne "Wrong Choice!\n\n"
 
	esac
 
done
 
