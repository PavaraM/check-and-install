#!/bin/bash
neededtool=$1
letmegohome=0

#Update package lists
echo "Updating package lists..."
sudo apt update -y &> /dev/null
clear

#Logging
echo "Starting tool check at $(date)" >> toolinstall.log
echo "Starting tool check at $(date)" >> toolinstall_errors.log

#Intro
echo "Check and Install Tool Script"
echo "------------------------------"
echo "Version 2.0"
echo
echo "This script will check for the existance of a tool and install it if it is not found."
echo "To exit the script at any time, type 'Exit' or 'exit' when prompted for a tool name."
echo

#Main Loop
while [ "$letmegohome" -ne 1 ];
do
	echo "DEBUG: $(date)" >> toolinstall.log
	echo "DEBUG: $(date)"  >> toolinstall_errors.log

#Prompt for tool if not provided as argument
	if [ -z "$neededtool" ]; then
		echo "You did not provide a tool as an argument"
		echo
		echo "NOTE:Enter the apt package name of the tool you want to check/install."
		read -p "What is the tool that you need: " neededtool
	fi

#Looking for the excistance of a required tool and installing it if necessory
	if [ -z "$neededtool" ]; then
	    echo "No tool entered, try again."
	    continue
	fi

#Prevent user from checking for this script
	if [ "$neededtool" = "doihaveit.sh" ]; then
	    echo "You cannot check for this script. Please try again."
	    neededtool=""
	    continue
	fi

#Exit Option
	if [ "$neededtool" = "Exit" ] || [ "$neededtool" = "exit" ]; then
	    echo "Exiting the script as per user request."
	    exit 0
	fi

#Reset jobdone variable
	jobdone=1

#Function to install tool
	install_tool() {
	    sudo apt install "$neededtool" -y
	    jobdone=$?
	}

#Check for tool and install if not found
	if command -v "$neededtool" &> /dev/null;
	then # Tool found
	    echo "$neededtool is already installed"
	    letmegohome=1
	else # Tool not found, install it
	    echo
	    echo "$neededtool is not installed. Installing now..."
	    install_tool >> toolinstall.log 2>> toolinstall_errors.log
	    
		#Check if installation was successful
		if [ $jobdone -eq 0 ]
	    then # Tool installed successfully
	        echo "$neededtool installed successfully..."
		letmegohome=1
 	    else # Tool installation failed
        	echo "something went wrong. Check the toolinstall_errors.log for information."
		letmegohome=0
   	    fi
	fi
done

#Cleanup
sleep 2
