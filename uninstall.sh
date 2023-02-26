#!/usr/bin/bash

#######################
# Uninstaller for NST #
#######################

if [ $(whoami) != "root" ]; then
	echo -e "\e[0;31m[!] Run the script as root\e[0m "
	exit
else
	MAIN_DIR='/usr/share/ntoolkit'
	EXEC_DIR='/usr/local/bin/ntoolkit'
	LAUNCHER='/usr/share/applications/applauncher.desktop'

	read -p "Confirm the uninstallation of NST (yes/no): " choice
	if [ "$choice" == "yes" ]; then
		# clearing the launcher configuration
		sudo echo "" > /usr/share/applications/applauncher.desktop 2>/dev/null

		echo -e "\n\e[1;31m[*]\e[0m Uninstalling The Network-Security Toolkit from your environment.."
		sleep 2

		# Deleting files...
		sudo rm -rf $MAIN_DIR 2>/dev/null

		sudo rm $EXEC_DIR 2>/dev/null
		sudo rm $LAUNCHER 2>/dev/null
		sudo rm $(pwd)/dependencies/.terms 2>/dev/null
		chmod -x $(pwd)/ntoolkit 
		echo -e "\e[1;31m[*]\e[0m Uninstallation Completed.\n"

	elif [ "$choice" == "no" ]; then
		echo -e "\e[0;32mExiting setup..\e[0m"
	fi
fi



