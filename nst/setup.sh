#!/usr/bin/env bash

##############################################
# INSTALLER FOR THE NETWORK-SECURITY TOOLKIT #
##############################################


CONNECTION_CHECK()
{
	wget -q --tries=10 --timeout=20 --spider http://google.com 2>/dev/null
	if [[ $? -eq 0 ]]; then
	    echo -e "\e[0;34m[+]\e[0m Network connection : \e[0;32mdetected\e[0m"
	else
	    echo -e "\e[0;31m[!]\e[0m Network connection :\e[0;31m not-detected\e[0m"
	    echo -e "\e[0;31m[!]\e[0m The setup requires internet connection for installing the dependencies."
	    echo -e "\e[0;31m[!]\e[0m Exiting setup...\n"
	    exit
	fi
}

VERSION_DETECT()
{
	VERSION=$(lsb_release -is)
	echo -e "\e[0;32m[+]\e[0m OS detected as : $VERSION\e[0m"
	echo -e "\e[0;32m[+]\e[0m Settings were configured according to your distro.\n"
}

banner()
{ 
	echo -e "\e[1;31m 
                     
        _______     ____________________
        \      \   /   _____/\__    ___/
        /   |   \  \_____  \   |    |   
       /    |    \ /        \  |    |   
       \____|__  //_______  /  |____|   
               \/         \/                  
                                       
   \e[0;34m The Network-Security Toolkit Setup Wizard\e[0m
	"
}

sudo rm $(pwd)/dependencies/.terms 2>/dev/null
chmod +x $(pwd)/uninstall.sh
chmod +x $(pwd)/nst-anon.sh

if [ $(whoami) != "root" ]
then
     echo -e "\e[1;31m[!] Run the setup as root\e[0m "
     exit
else
	# clear
	banner
	CONNECTION_CHECK
	VERSION_DETECT
	under=$(tput smul)
	normal=$(tput sgr0)

	echo -e "\e[0;34m[*] Network-Security Toolkit's requirements will now be installed\e[0m\n"

	# list of directories
	MAIN_DIR='/usr/share/ntoolkit'
	DEPENDENCIES_DIR='/usr/share/ntoolkit/dependencies/'
	PAYLOAD_DIR='/usr/share/ntoolkit/payloads'
	CHECK_DIR='/usr/share/ntoolkit/.check'
	SLOWLORIS='$(pwd)/dependencies/slowloris'
	ICON_DIR='/usr/share/ntoolkit/icon'
	LAUNCHER='/usr/local/bin/ntoolkit'
	PROXY_DIR='/usr/share/ntoolkit/proxy'

	if [ -d $MAIN_DIR ]; then
		echo -n -e "\e[1;32m[+]\e[0m Directory ntoolkit was found! Do you want to replace it [Y/n]: "
		read REPLACE
		if [ $REPLACE == "Y" ]; then
			sleep 1
			sudo rm -rf $MAIN_DIR 2>/dev/null 
		else
			echo 
			echo -e "\e[0;31m[!] You have to remove previous installations first in order to proceed. \e[0m "
			echo -e "\e[0;31m[!] Installation failed!\e[0m \n"
			exit 
		fi
	fi

	echo -e "\n\e[1;32m[*] Checking for directories...\e[0m"

	DIRECTORY=(
		$MAIN_DIR
		$DEPENDENCIES_DIR
		$CONFIG_DIR
		$PAYLOAD_DIR
		$CHECK_DIR
		$ICON_DIR
		)

	for i in ${DIRECTORY[@]}
	do
		if [ -d $i ]; then
			flag=true
		else
			flag=false
			mkdir $i 2>/dev/null 
		fi
	done

	if [ $flag == "true" ]
	then
		echo -e "\e[1;32m[+]\e[0m Directories found!\e[0m"
	fi

	echo 
	echo -e "\e[1;32m[*] Checking for requirements...\e[0m"
	
	REQUIREMENTS=(
		net-tools
		proxychains
		nmap
		netdiscover
		hash-identifier
		nbtscan
		dnsenum
		macchanger
		smtp-user-enum
		msfpc
		hashdeep
		metasploit-framework
		gobuster
		sqlmap
		yersinia
		joomscan
		wpscan
		hping3
		libpcap-dev
		libsqlite3-dev
		pixiewps
		aircrack-ng
		hashid
		)

	##Checking the requirements...
	for j in ${REQUIREMENTS[@]}
	do
		if ! dpkg -s $j &> /dev/null
		then
			echo ""
			echo -e "\e[1;31m[!]\e[0m Installing Package $j"
			echo -e "\e[0;33m $(apt-get -y install $j 2>/dev/null)\e[0m"

			if dpkg -s $j &> /dev/null
			then
				touch /usr/share/ntoolkit/.check/$j 2>/dev/null
				echo "DONE!"
			else
				echo -e "\n\e[1;31m[!] There was a problem installing the requirement $j...Skipping!"
				continue
			fi
		else
			echo -e "\e[1;32m[+]\e[0m $j....Found!"
			touch /usr/share/ntoolkit/.check/$j 2>/dev/null
		fi
	done

	apt-get install pip

	if [ -d $SLOWLORIS ]; then
		echo -e "\e[1;32m[+]\e[0m Slowloris found!"
	else
		pip3 install slowloris 
		touch /usr/share/ntoolkit/.check/slowloris 2>/dev/null
		pip3 install pysocks
	fi
	
	echo
	cp $(pwd)/dependencies/horn-clipart-wild-west-15.png /usr/share/ntoolkit/icon 2>/dev/null
	echo -e "\e[1;32m[*] Finalizing...\e[0m"
	echo -e "${bold}\e[1;32m[+]\e[0m${normal} Creating launcher for ntoolkit"

	if [ -f $LAUNCHER ]; then
		sudo rm $LAUNCHER
		ln -s $(pwd)/ntoolkit /usr/local/bin 2>/dev/null #linking the new file 
	else
		ln -s $(pwd)/ntoolkit /usr/local/bin 2>/dev/null #linking the file
	fi

	cp $(pwd)/dependencies/applauncher.desktop /usr/share/applications 2>/dev/null
	sudo chmod +x /usr/share/applications/applauncher.desktop 2>/dev/null
	sudo chmod +x /usr/local/bin/ntoolkit 2>/dev/null
	cp -r $(pwd)/dependencies /usr/share/ntoolkit/dependencies 2>/dev/null
	sudo cp $(pwd)/dependencies/uncover.sh /usr/share/ntoolkit/dependencies/dependencies/
	chmod +x /usr/share/ntoolkit/dependencies/dependencies/uncover.sh
	sudo chmod +x /usr/share/ntoolkit/dependencies 2>/dev/null
	chmod +x $(pwd)/ntoolkit 
	chmod +x $(pwd)/dependencies/uncover.sh
	echo -e "\e[1;32m[+]\e[0m Granted required privileges to the file..."
	echo -e "\e[1;32m[+]\e[0m Done with the setup..."
	echo -e "\e[1;32m[+]\e[0m Type '${bold}sudo ntoolkit -s${normal}' to start the Network-Security Toolkit"
	echo -e "\e[1;32m[+]\e[0m Consider yourself visiting my website ${under}https://www.ragedinfosec.com${normal}"
fi
