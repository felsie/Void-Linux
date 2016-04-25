#!/bin/bash
##Fix-DNS
#Start at boot or copy rows 5 and 6 to /etc/rc.local

echo "nameserver 194.150.168.168" >> /etc/resolv.conf 
echo "nameserver 8.8.4.4" >> /etc/resolv.conf #Moar as an Backup. #Privacy

exit
