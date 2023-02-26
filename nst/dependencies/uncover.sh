#!/usr/bin/env bash


#coded by - Kartik Iyer

function banner()
{
under=$(tput smul)
bold=$(tput bold)
normal=$(tput sgr0)
echo -e "Welcome to NST's ${bold}Uncover framework${normal}. This can perform basic enumerations/analysis on a linux administered system.
Note: Uncover cannot perform core analysis on a system as it is still ongoing updations.\n 
${bold}\e[0;34m[-]\e[0m${normal} Uncover is a part of The Network-Security Toolkit.
${bold}\e[0;34m[-]\e[0m${normal} Linux version detected : $(lsb_release -is)\n
                                                                                       "                    

}

function HELP()
{
	echo  
	echo -e "${bold}Modules:${normal}\n"
	# echo "------------------------------------------------------------------------------------------------"
	echo "   help                          will display this menu"
	echo "   version                       will display the version of this program"
	echo "   reset                         will reset this tool's configurations"
	echo "   show kernel name              will detect this system's kernel name"
	echo "   show kernel version           will detect this system's kernel version"
	echo "   hardware                      will detect this system's hardware type"
	echo "   show accounts                 will display options related to user-accounts on this system"
	echo "   show logs                     will display options related to log-entries on this system"
	echo "   show sys_resources            will display options related to system resources of this system"
	echo "   show timelines                will display options related to timestamps of filesystems"
	echo "   show processes                will display options related to processes running on this system"
	echo "   show services                 will display options related to services running on this system"
	echo "   show files                    will display options related to the list of files of this system"
	echo "   show network                  will display options related to networks on this system"
	echo "   search bin_image              will search for binary images for embedded files & executables"
	echo "   check rootkit                 will scan this system for rootkits"
	echo "   scan                          will scan this device for virus"
	echo "   clone disk image              will help in cloning a disk image"
	echo "   about                         will display information about Uncover"
	echo "   exit                          will exit Uncover"
	echo
}

function hardware()
{
	uname -m
}

function kernel_version()
{
	uname -v
}

function kernel_name()
{
	uname -s 
	echo
}

function scan_virus()
{
	echo -e "\e[1;0m Scanning root folder...\n"
	clamscan /* 
	echo 
	echo -e "\e[1;0m Scanning home folder...\n"
	clamscan *
	echo
}

function rootkit()
{
	echo 
	echo -e "${bold}Scanning:${normal}\n"
	# echo 
	chkrootkit -q 
	echo 
}

function show_network()
{
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9
	echo
	echo -e "${bold}Menu:${normal} \n"
	echo "   1) To view ip configuration"
	echo "   2) To view all the processes listening to a port"
	echo "   3) To view all the listening ports in a network view"
	echo "   4) To view this system's arp cache"
	echo "   5) To view this system's routing table entry"
	echo "   6) To start capturing packets on this system"
	echo
	while true
	do
	echo -n -e "${under}uncover${normal}:${under}\e[0;31mnetwork\e[0m${normal} > " 
	read network_choice
	if [ "$network_choice" == "1" ]
	then
		echo
		echo -e "${bold}Ip config:${normal}\n"
		ip addr show
		echo 
	elif [ "$network_choice" == "exit" ]
	then
		cowsay -f tux Goodbye
		exit
	elif [ "$network_choice" == "2" ]
	then
		echo
		echo -e "${bold}Processes:${normal}\n"
		lsof -i
		echo
	elif [ "$network_choice" == "3" ]
	then
		echo
		echo -e "${bold}Listening ports:${normal}\n"
		netstat -nap
		echo
	elif [ "$network_choice" == "4" ]
	then
		echo
		echo -e "${bold}Processes:${normal}\n"
		arp -a 
		echo
	elif [ "$network_choice" == "5" ]
	then
		echo
		echo -e "${bold}Routing table:${normal}\n"
		ip route show
		echo
	elif [ "$network_choice" == "6" ]
	then
		echo 
		echo -e "${bold}Menu:${normal} \n"
		echo "   1) To capture traffic normally"
		echo "   2) To capture traffic to & from one host"
		echo "   3) To capture traffic to & from a network"
		echo "   4) To capture traffic to and from port number"
		echo ""
		while true
		do
		read -p "${under}uncover${normal}:${under}network${normal}:${under}capture${normal} > " netcap_choice
		if [ "$netcap_choice" == "1" ]
		then
			read -p "Enter the interface name: " iname
			echo 
			tcpdump -i $iname
			echo 
		elif [ "$netcap_choice" == "2" ]
		then
			read -p "Enter the interface name: " iname
			read -p "Enter ip address: " ip
			read -p "Do you wish to see incoming or outgoing packets(I/O): " pkt_choice
			if [ "$pkt_choice" == "O" ]
			then
				echo 
				tcpdump -i $iname -c 10 dst host $ip
				echo
			elif [ "$pkt_choice" == "I" ]
			then
				echo 
				tcpdump -i $iname src host $ip 
				echo 
			else
				echo 
				echo "Enter valid argument"
				echo 
			fi
		elif [ "$netcap_choice" == "3" ]
		then
			read -p "Enter the interface name: " iname
			read -p "Enter ip address: " ip
			tcpdump -i $iname net $ip/24
			echo 
		elif [ "$netcap_choice" == "4" ]
		then
			read -p "Enter the interface name: " iname
			read -p "Enter ip address/domain name: " ip
			read -p "Enter port number: " port
			tcpdump -i $iname host $ip and port $port
			echo
		elif [ "$netcap_choice" == "exit" ]
		then
			show_network 
		fi
	    done
	fi
    done
}

function show_files()
{
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9
	echo
	echo -e "${bold}Menu:${normal} \n"
	echo "   1) To find any large file & their permission with their destination"
	echo "   2) To find all the files to which SUID bit is set"
	echo
	while true
	do
	read -p "${under}uncover${normal}:${under}files${normal} > " file_choice
	if [ "$file_choice" == "1" ]
	then
		echo
		echo -e "${bold}Files:${normal}\n"
		find /home/ -type f -size +512k -exec ls -lh {} \;
		echo 
	elif [ "$file_choice" == "2" ]
	then
		echo
		echo -e "${bold}Files:${normal}\n"
		find / -perm -u=s -type f 2>/dev/null
		echo
	elif [ "$file_choice" == "help" ]
	then
		HELP
	elif [ "$file_choice" == "show accounts" ]
	then
		show_accounts
	elif [ "$file_choice" == "show logs" ]
	then
		show_logs
	elif [ "$file_choice" == "show sys_resources" ]
	then
		show_sys_resources
	elif [ "$file_choice" == "show processes" ]
	then
		show_processes
	elif [ "$file_choice" == "show services" ]
	then
		show_services
	elif [ "$file_choice" == "show timelines" ]
	then
		show_timestamps
	elif [ "$file_choice" == "exit" ]
	then
		cowsay -f tux Goodbye
		exit
	fi
	done
}

function show_services()
{
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9
	echo
	echo -e "${bold}Menu:${normal} \n"
	echo "   1) To view running services on this system"
	echo "   2) To view cron jobs on this system"
	echo "   3) To view DNS configuration issues"
	echo "   4) To view hosts configuration file"
	echo "   5) To view iptables configuration of this system"
	echo
	while true
	do
	read -p "${under}uncover${normal}:${under}services${normal} > " service_choice
	if [ "$service_choice" == "1" ]
	then
		echo
		echo -e "${bold}Services:${normal}\n"
		service --status-all
		echo
	elif [ "$service_choice" == "2" ]
	then
		echo
		echo -e "${bold}Cronjobs:${normal}\n"
		crontab -l
		echo
	elif [ "$service_choice" == "3" ]
	then
		echo
		echo -e "${bold}DNS:${normal}\n"
		cat /etc/resolv.conf
		echo
	elif [ "$service_choice" == "4" ]
	then
		echo
		echo -e "${bold}Hosts:${normal}\n"
		cat /etc/hosts
		echo
	elif [ "$service_choice" == "5" ]
	then
		echo
		echo -e "${bold}Iptables:${normal}\n"
		iptables -nL
		echo
	elif [ "$service_choice" == "help" ]
	then
		HELP
	elif [ "$service_choice" == "show accounts" ]
	then
		show_accounts
	elif [ "$service_choice" == "show logs" ]
	then
		show_logs
	elif [ "$service_choice" == "show sys_resources" ]
	then
		show_sys_resources
	elif [ "$service_choice" == "show processes" ]
	then
		show_processes
	elif [ "$service_choice" == "exit" ]
	then
		cowsay -f tux Goodbye
		exit
	fi
	done
}

function show_processes()
{
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9
	echo
	echo -e "${bold}Menu:${normal} \n"
	echo "   1) To view all processes currently running in this system"
	echo "   2) To view process status & PID of the currently running processes"
	echo "   3) To view detailed information about a particular process"
	echo
	while true
	do
	read -p "${under}uncover${normal}:${under}processes${normal} > " process_choice
	if [ "$process_choice" == "1" ]
	then
		echo
		echo -e "${bold}TOP:${normal}\n"
		top
		echo
	elif [ "$process_choice" == "2" ]
	then
		echo
		echo -e "${bold}Processes:${normal}\n"
		ps -aux
		echo
	elif [ "$process_choice" == "3" ]
	then
		echo
		ps -aux
		echo
		read -p "Enter the PID of that process: " pid
		echo
		echo -e "${bold}Information about the process ID $pid:${normal}\n" 
		lsof -p $pid
		echo 
	elif [ "$process_choice" == "help" ]
	then
		HELP
	elif [ "$process_choice" == "show accounts" ]
	then
		show_accounts
	elif [ "$process_choice" == "show logs" ]
	then
		show_logs
	elif [ "$process_choice" == "show sys_resources" ]
	then
		show_sys_resources
	elif [ "$process_choice" == "exit" ]
	then
		cowsay -f tux Goodbye
		exit
	fi
	done
}

function show_timestamps()
{
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9
	echo
	echo -e "${bold}Menu:${normal} \n"
	echo "   1) To view the last time data written to a file"
	echo "   2) To view the last time file was read"
	echo "   3) To view the last time inode contents was written/changed to a file"
	echo "   4) To view the timestamp of when a file is been created"
	echo 
	while true
	do
	read -p "${under}uncover${normal}:${under}timestamp${normal} > " time_choice
	if [ "$time_choice" == "1" ]
	then
		read -p "Enter time(in days): " time
		echo
		echo -e "${bold}Modification time:${normal}\n"
		find / -mtime $time -ls
		echo
	elif [ "$time_choice" == "2" ]
	then
		read -p "Enter time(in days): " time
		echo
		echo -e "${bold}Access time:${normal}\n"
		find / -atime $time -ls
		echo
	elif [ "$time_choice" == "3" ]
	then
		read -p "Enter time(in days): " time
		echo
		echo -e "${bold}Change time:${normal}\n"
		find / -ctime $time -ls
		echo
	elif [ "$time_choice" == "4" ]
	then
		read -p "Enter time(in days): " time
		echo
		echo -e "${bold}Born-on time:${normal}\n"
		find / -btime $time -ls
		echo 
	elif [ "$time_choice" == "help" ]
	then
		HELP
	elif [ "$time_choice" == "show accounts" ]
	then
		show_accounts
	elif [ "$time_choice" == "show logs" ]
	then
		show_logs
	elif [ "$time_choice" == "show sys_resources" ]
	then
		show_sys_resources
	elif [ "$time_choice" == "show processes" ]
	then
		show_processes
	elif [ "$time_choice" == "exit" ]
	then
		cowsay -f tux Goodbye
		exit
	elif [ "$time_choice" == "show services" ]
	then
		show_services
	fi
	done
}

function show_sys_resources()
{
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9
	echo
	echo -e "${bold}Menu:${normal} \n"
	echo "   1) To view report of how long the server is been running"
	echo "   2) To view memory utilisation of the system"
	echo "   3) To view memory information of the system"
	echo "   4) To check for mounts present in the system"
	echo "   5) To check for permanent mounting points"
	echo
	while true
	do
	read -p "${under}uncover${normal}:${under}sys-resources${normal} > " sys_choice
	if [ "$sys_choice" == "1" ]
	then
		echo
		echo -e "${bold}Uptime:${normal}\n"
		uptime
		echo
	elif [ "$sys_choice" == "2" ]
	then
		echo
		echo -e "${bold}Memory utilisation:${normal}\n"
		free -h
		echo
	elif [ "$sys_choice" == "3" ]
	then
		echo
		echo -e "${bold}Memory info:${normal}\n"
		cat /proc/meminfo
		echo
	elif [ "$sys_choice" == "4" ]
	then
		echo
		echo -e "${bold}Mounts:${normal}\n"
		cat /proc/mounts
		echo
	elif [ "$sys_choice" == "5" ]
	then
		echo
		echo -e "${bold}Fstab records:${normal}\n"
		cat /etc/fstab
		echo
	elif [ "$sys_choice" == "exit" ]
	then
		cowsay -f tux Goodbye
		exit
	elif [ "$sys_choice" == "help" ]
	then
		HELP
	elif [ "$sys_choice" == "show accounts" ]
	then
		show_accounts
	elif [ "$sys_choice" == "show logs" ]
	then
		show_logs
	fi
	done
}

function show_logs()
{
	keyboard_interrupt()
			{
				echo ""
				echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
				# echo ""
				exit 2
			}
			trap "keyboard_interrupt" 2 9
			echo 
			echo -e "${bold}Menu:${normal} \n"
			echo "   1) To view reports of most recent login"
			echo "   2) To view reports of ssh/telnet logins"
			echo "   3) To view reports of boot time"
			echo "   4) To view reports of kernel activities"
			echo "   5) To view reports system activities"
			echo "   6) To view reports of daemon activities"
			echo "   7) To view reports of failed login attempts"
			echo "   8) To view the history of commands"
			echo 
			while true
			do
			read -p "${under}uncover${normal}:${under}logs${normal} > " log_choice
			if [ "$log_choice" == "1" ]
			then
				echo
				echo -e "${bold}Login report:${normal}\n"
				lastlog
				echo
			elif [ "$log_choice" == "2" ]
			then
				echo
				echo -e "${bold}Login report:${normal}\n"
				cat /var/log/auth.log
				echo
			elif [ "$log_choice" == "3" ]
			then
				echo
				echo -e "${bold}Boot report:${normal}\n"
				cat /var/log/boot.log
				echo
			elif [ "$log_choice" == "4" ]
			then
				echo
				echo -e "${bold}Kernel report:${normal}\n"
				cat /var/log/kern.log
				echo
			elif [ "$log_choice" == "5" ]
			then
				echo
				echo -e "${bold}System report:${normal}\n"
				cat /var/log/syslog
				echo
			elif [ "$log_choice" == "6" ]
			then
				echo
				echo -e "${bold}Daemon report:${normal}\n"
				cat /var/log/daemon.log
				echo
			elif [ "$log_choice" == "7" ]
			then
				echo
				echo -e "${bold}Failed login report:${normal}\n"
				cat /var/log/lastlog
				echo
			elif [ "$log_choice" == "8" ]
			then
				echo
				echo -e "${bold}History of commands report:${normal}\n"
				history
				echo
			elif [ "$log_choice" == "help" ]
			then
				HELP
			elif [ "$log_choice" == "show accounts" ]
			then
				show_accounts
			elif [ "$log_choice" == "show logs" ]
			then
				show_logs
			elif [ "$log_choice" == "show sys_resources" ]
			then
				show_sys_resources
			elif [ "$log_choice" == "show processes" ]
			then
				show_processes
			elif [ "$log_choice" == "exit" ]
			then
				cowsay -f tux Goodbye
				exit
					
			fi
			done
}

function show_accounts()
{
	# show_accounts
			keyboard_interrupt()
			{
				echo ""
				echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
				# echo ""
				exit 2
			}
			trap "keyboard_interrupt" 2 9

			echo 
			echo -e "${bold}Menu:${normal} \n"
			echo "   1) To view all the user accounts"
			echo "   2) To view a particular user account"
			echo "   3) To view whether a temporary user is created on this system"
			echo "   4) To view encrypted passwords and details"
			echo "   5) To view groups used by the user"
			echo "   6) To view info about the user & group privileges"
			echo
			while true
			do 
			read -p "${under}uncover${normal}:${under}accounts${normal} > " account_choice
			if [ "$account_choice" == "1" ]
			then
				echo 
				echo -e "${bold}User accounts:${normal} \n"
				cat /etc/passwd
				echo
			elif [ "$account_choice" == "2" ]
			then
				# echo
				read -p "Enter username: " username
				echo -e "${bold}User account:${normal} \n"
				cat /etc/passwd | grep "$username" 
				echo 
			elif [ "$account_choice" == "3" ]
			then
				echo 
				find / -nouser -print
				echo 
			elif [ "$account_choice" == "4" ]
			then
				echo
				echo -e "${bold}User's encrypted passwords:${normal}\n"
				cat /etc/shadow
				echo
			elif [ "$account_choice" == "5" ]
			then
				echo 
				echo -e "${bold}User groups:${normal}\n"
				cat /etc/group
				echo
			elif [ "$account_choice" == "6" ]
			then
				echo
				echo -e "${bold}Sudoers file:${normal}\n"
				cat /etc/sudoers
				echo
			elif [ "$account_choice" == "exit" ]
			then
				cowsay -f tux Goodbye
				exit
			elif [ "$account_choice" == "help" ]
			then
				HELP
			elif [ "$account_choice" == "show logs" ]
			then
				show_logs
			elif [ "$account_choice" == "show network" ]
			then
				show_network
			elif [ "$account_choice" == "show processes" ]
			then
				show_processes
			elif [ "$account_choice" == "show files" ]
			then
				show_files
			elif [ "$account_choice" == "show services" ]
			then
				show_services
			elif [ "$account_choice" == "show timelines" ]
			then
				show_timestamps
			elif [ "$account_choice" == "show sys_resources" ]
			then
				show_sys_resources
			elif [ "$account_choice" == "check rootkit" ]
			then
				rootkit
			elif [ "$account_choice" == "scan" ]
			then
				scan_virus
			fi
			done
}

function main()
{
	# clear
	keyboard_interrupt()
	{
		echo ""
		echo -e " \n\n\e[0;31m QUITTING!\e[0m\n"
		# echo ""
		exit 2
	}
	trap "keyboard_interrupt" 2 9

	if [ $(whoami) != "root" ]
	then
		# echo
		banner 
		echo -e "\e[0;31m[!] ROOT privileges Required\e[0m\n"
	else
		# echo
		# echo -e "\e[0;31m[!] No arguments supplied\e[0m"
		banner
		while true
		do
		read -p "${under}uncover${normal} > " user_input
		if [ "$user_input" == "clear" ]
		then
			clear
			main
		elif [ "$user_input" == "help" ]
		then
			# sleep 1
			HELP
		elif [ "$user_input" == "version" ]
		then
			echo 
			echo -e "1.0.0\n"
		elif [ "$user_input" == "show kernel name" ]
		then
			echo
			kernel_name
		elif [ "$user_input" == "show kernel version" ]
		then
			echo
			kernel_version
			echo
		elif [ "$user_input" == "hardware" ]
		then
			echo
			hardware
			echo
		elif [ "$user_input" == "exit" ]
		then
			exit
		elif [ "$user_input" == "show accounts" ]
		then
			show_accounts
		elif [ "$user_input" == "show logs" ]
		then
			show_logs
		elif [ "$user_input" == "show sys_resources" ]
		then
			show_sys_resources
		elif [ "$user_input" == "show processes" ]
		then
			show_processes
		elif [ "$user_input" == "show services" ]
		then
			show_services
		elif [ "$user_input" == "show timelines" ]
		then
			show_timestamps
		elif [ "$user_input" == "show files" ]
		then
			show_files
		elif [ "$user_input" == "show network" ]
		then
			show_network
		elif [ "$user_input" == "check rootkit" ]
		then
			rootkit
		elif [ "$user_input" == "scan " ]
		then
			scan_virus
		elif [ "$user_input" == "reset" ]
		then
			sleep 1 
			clear
			banner
			main
		else
			# echo
			echo -e "\e[0;31m[!] Invalid argument: $user_input\e[0m"
		fi 

		done
	fi
}
main

