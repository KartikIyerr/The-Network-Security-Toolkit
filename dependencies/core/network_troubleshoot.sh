#!/usr/bin/env bash 

# SIMPLE NETWORK TROUBLESHOOT MENU

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
					traceroute -T ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $net_option -eq 3 ]
				then
					read -p "Enter domain/ip: " ip_addr
					echo ""
					echo "[*] Pinging...sending 5 pkts by default"
					echo ""
					ping -c 5 $ip_addr
					echo ""
					echo "DONE!"
					echo ""
				elif [ $net_option -eq 4 ]
				then
					echo "[*] Hey neighbour! where are you?"
					echo ""
					ip neighbour show
					echo ""
				elif [ $net_option -eq 5 ]
				then
					echo "[*] Here's your arp entries"
					echo ""
					arp -e -v 
					echo ""
				elif [ $net_option -eq 6 ]
				then
					read -p "Specify your interface(eth*/wlan*): " interface
					echo ""
					echo "[*] Finding devices..."
					echo ""
					netdiscover -i $interface
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
					ifconfig eth0 $ip_addr
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
							iwconfig $wire_inter
							echo 
						elif [ "$choice1" == "2" ]
						then
							echo 
							iwconfig $wire_inter up 
							echo "Interface up"
							echo 
						elif [ "$choice1" == "3" ]
						then 
							echo 
							airmon-ng $wire_inter
							echo "Monitor mode ONN"
							echo 
						elif [ "$choice1" == "4" ]
						then 
							echo 
							iwconfig $wire_inter down
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
			networking