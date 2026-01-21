#!/bin/bash

letmegohome=0

while [ $letmegohome -ne 1 ];
do
	echo "DEBUG: $(date)" >> toolinstall.log
	echo "DEBUG: $(date)"  >> toolinstall_errors.log
	echo "This Program will check and install a tool you need"
	echo
	read -p "What is the tool you need: " neededtool

	##Looking for the excistance of a required tool and installing it if necessory
	if [ -z "$neededtool" ]; then
	    echo "No tool entered, try again."
	    continue
	fi


	#Intial Variables
	jobdone=1

	#Functions
	install_tool() {
	    sudo apt update
	    sudo apt install $neededtool -y
	    jobdone=$?
	}

	#If Statements
	if command -v $neededtool &> /dev/null;
	then
	    echo "$neededtool is already installed"
	    letmegohome=1
	else
	    echo
	    echo "$neededtool is not installed. Installing now..."
	    install_tool >> toolinstall.log 2>> toolinstall_errors.log
	    if [ $jobdone -eq 0 ]
	    then
	        echo "$neededtool installed successfully..."
		letmegohome=1
 	    else
        	echo "something went wrong. Check the toolinstall_errors.log for information."
		letmegohome=0
   	    fi
	fi
done

sleep 2
