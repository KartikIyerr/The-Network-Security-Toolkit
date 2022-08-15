#!/usr/bin/env bash 


# Anonymizing script for The Network-Security Toolkit
# Written by - Kartik Iyer



# check if user is root. If not, then exit.
if [ $(whoami) != "root" ]; then
	echo -e "\e[0;0m\e[0mRun as \e[1;31mroot\e[0m "
	exit 

else

	SIGTERM()
	{
		echo -e "\n\e[1;34m[-]\e[0m Cleaning up.."
		if [ ${flag} == "1" ] 2>/dev/null; then
			rm /usr/share/ntoolkit/.anon_check
			rm -rf /etc/proxychains4_dynamic.conf && cp $(pwd)/dependencies/proxychains/proxychains4.conf /etc/
			sleep 1
			echo -e "\e[1;34m[-]\e[0m Reverting back the desired changes."
			ifconfig ${interface} down
			macchanger -p $interface > /usr/share/ntoolkit/.macchanger_output.txt
			ifconfig ${interface} up
			sleep 1
			echo -e "\e[1;34m[-]\e[0m NST_ANON Status :\e[1;31m Disabled\e[0m"
			sleep 1
			echo -e "\e[1;34m[-]\e[0m everything is now back to normal."
			exit

		elif [ ${flag} == "2" ] 2>/dev/null; then 
			rm /usr/share/ntoolkit/.anon_check
			rm -rf /etc/proxychains4_strict.conf && cp $(pwd)/dependencies/proxychains/proxychains4.conf /etc/
			sleep 1
			echo -e "\e[1;34m[-]\e[0m Reverting back the desired changes."
			ifconfig ${interface} down
			macchanger -p $interface > /usr/share/ntoolkit/.macchanger_output.txt
			ifconfig ${interface} up
			sleep 1
			echo -e "\e[1;34m[-]\e[0m NST_ANON Status :\e[1;31m Disabled\e[0m"
			sleep 1
			echo -e "\e[1;34m[-]\e[0m everything is now back to normal."
			exit

		elif [ ${flag} == "3" ] 2>/dev/null; then
			rm /usr/share/ntoolkit/.anon_check
			rm -rf /etc/proxychains4_round.conf && cp $(pwd)/dependencies/proxychains/proxychains4.conf /etc/
			sleep 1
			echo -e "\e[1;34m[-]\e[0m Reverting back the desired changes."
			ifconfig ${interface} down
			macchanger -p $interface > /usr/share/ntoolkit/.macchanger_output.txt
			ifconfig ${interface} up
			sleep 1
			echo -e "\e[1;34m[-]\e[0m NST_ANON Status :\e[1;31m Disabled\e[0m"
			sleep 1
			echo -e "\e[1;34m[-]\e[0m everything is now back to normal."
			exit
		fi
		exit 2
	}
	trap "SIGTERM" 2
	bold=$(tput bold)
	normal=$(tput sgr0)
	MAIN_PROXY_DIR='/etc/proxychains4.conf'
	NST_PROXY_DIR='/usr/share/ntoolkit/proxy'

	#detecting OS
	OS_DETECT=$(lsb_release -is)
	RELEASE_DETECT=$(lsb_release -rs)

	echo -e "====================================================================================="
	echo -e "                The Network-Security Toolkit's anonymizer wizard.."
	echo -e "                 This will maintain the anonymity of this system."
	echo -e "=====================================================================================\n"

	echo -e "\e[1;31m[-]\e[0m OS Detected as: \e[1;31m${OS_DETECT}-${RELEASE_DETECT}\e[0m\n"

	echo -e "====================================================================================="
	echo -e "                            Proxychains Setup Wizard                                 "
	echo -e "=====================================================================================\n"

	echo -e "\e[1;32m[-]\e[0m Dynamic - Dynamic chaining will enable us to run our traffic through every proxy on our list, 
and if one of the proxies is down or not responding, the dead proxies are skipped.\n"
	echo -e "\e[1;32m[-]\e[0m Random - Random chaining will allow proxychains to randomly choose IP addresses from our list 
and each time we use proxychains, the chain of proxy will look different to the target, making it harder 
to track our traffic from its source.\n"
	echo -e "\e[1;32m[-]\e[0m Strict - Strict chain uses all the proxies in the list in order. No proxy is skipped.\n"

	echo -n -e "\e[1;32m[-]\e[0m Your wish (Dynamic${bold}[d]${normal}/Strict${bold}[s]${normal}/Round${bold}[r]${normal}): " 
	read proxy_wish

	if [ $proxy_wish == "d" ]; then
		flag=1
		mv ${MAIN_PROXY_DIR} ${NST_PROXY_DIR}
		cp $(pwd)/dependencies/proxychains/proxychains4_dynamic.conf /etc/ 
		mv /etc/proxychains4_dynamic.conf /etc/proxychains4.conf  
		sleep 1
		echo -e "\e[1;32m[-]\e[0m Dynamic proxy is being set-up."
		echo -e "\e[1;32m[-]\e[0m Proxy DNS is being enabled by default to avoid DNS leaks.\n"
	    

	elif [ $proxy_wish == "s" ]; then
		flag=2
		mv ${MAIN_PROXY_DIR} ${NST_PROXY_DIR}
		cp $(pwd)/dependencies/proxychains/proxychains4_strict.conf /etc/
		mv /etc/proxychains4_strict.conf /etc/proxychains4.conf 
		sleep 1
		echo -e "\e[1;32m[-]\e[0m Strict proxy is being set-up."
		echo -e "\e[1;32m[-]\e[0m Proxy DNS is being enabled by default to avoid DNS leaks.\n"

	elif [ $proxy_wish == "r" ]; then
		flag=3
		mv ${MAIN_PROXY_DIR} ${NST_PROXY_DIR}
		cp $(pwd)/dependencies/proxychains/proxychains4_round.conf /etc/
		mv /etc/proxychains4_round.conf /etc/proxychains4.conf 
		sleep 1
		echo -e "\e[1;32m[-]\e[0m Random proxy is being set-up."
		echo -e "\e[1;32m[-]\e[0m Proxy DNS is being enabled by default to avoid DNS leaks.\n"
	fi

	echo -e "====================================================================================="
	echo -e "            Spoofing MAC address to maintain anonymity of this system                "
	echo -e "=====================================================================================\n"
	read -p "[>] Enter your interface name: " interface
	ifconfig $interface down
	macchanger -e $interface
	echo 
	macchanger -e $interface
	echo 
	macchanger -e $interface
	ifconfig $interface up
	echo 
	echo -e "\e[1;32m[-]\e[0m MAC address is now being masked successfully."
	echo -e "\e[1;32m[-]\e[0m NST_ANON Status :\e[1;32m Enabled\e[0m"
	echo -e "\e[1;34m[-]\e[0m Open a new tab and run ${bold}sudo ntoolkit -s${normal} to use NST anonymously.\n"

	# Creating a recognizing marker...
	touch /usr/share/ntoolkit/.anon_check

	echo -e "\e[0;31m-=[ Keep this script running, Ctrl+c to revert back the changes ]=-\e[0m"
	sleep 20000

fi








	

