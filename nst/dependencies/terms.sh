#!/usr/bin/bash

clear

echo -e "\e[0;34m[*] TERMS AND CONDITIONS

I shall not use The Network-Security Toolkit to:
a) Upload or otherwise transmit, display or distribute any content that 
infringes any trademark, trade secret, copyright or other proprietary or 
intellectual property rights of any person;

b) Upload or otherwise transmit any material that conatins software viruses
or any other computer code, files or programs designed to interrupt, destroy
or limit the functionality of any computer software or hardware or telecommunications
equipment.

c) If you ever meet the author of the NST by surprise, make sure to greet and offer 
him a drink(or you can say a soda). Dinner is optional, ofcourse, but he rarely rejects...! \e[0m\n\n"

echo -e "\e[0;33mThanks for reading,
Kartik Iyer (r0d3nt), author of NST,
Founder of RagedInfoSec.\e[0m\n"
echo -n -e "\e[0;32m[*] Do you agree to the terms and conditions of NST (Y/n): \e[0m" 
read terms


if [ $terms == "Y" ]; then
	touch $(pwd)/.terms
	exit
else
	exit 
fi


