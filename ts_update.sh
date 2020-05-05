#!/bin/bash
systemctl stop teamspeak
Teamspeak=$(curl -s "https://www.teamspeak.com/versions/server.json" | jq '."linux"."x86_64"."mirrors"."teamspeak.com"')
tsdownload=tsdownload.tar.bz2
su - ts3 -c "wget $Teamspeak -O /home/ts3/$tsdownload"
su - ts3 -c "tar -xjf /home/ts3/$tsdownload"
su - ts3 -c "rm /home/ts3/$tsdownload"
sleep 5
systemctl start teamspeak
