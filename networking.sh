#!/bin/bash
##""Networking""
###$1=Your IP-Adress.
###$2=Your CIDR-Subnetzmask withount the leading "/".
###$3=Your Broadcast Adress (something like 192.168.178.255 if you got an Fritzbox).
###$4=Your Gateway (like 192.168.178.1 if you got an Fritzbox).
###$5=Save it to /etc/rc.local?

if [ $5 == "yes" ]
then
  echo "Setting up.."
  echo "ip link set dev eth0 up" >> /etc/rc.local
  echo "ip addr add $1/$2 broadcast $3 dev eth0" >> /etc/rc.local
  echo "ip route add default via $4" >> /etc/rc.local
  echo "Writen to /etc/rc.local"
else
  ip link set dev eth0 up
  ip addr add $1/$2 broadcast $3 dev eth0
  ip route add default via $4
fi

if ping -c 1 github.com &> /dev/null
then
  echo "U GOT INTERNET!"
else
  echo "Something Wrong."
  echo "                "
  echo "Delete default Gateway with:"
  echo "route del default gw $4"
  echo "Delete Ip-Adress with:"
  echo "ip addr del $1/$2 dev eth0"
  echo "Dissable networkcard with:"
  echo "ip link set dev eth0 down"
  echo "                "
  echo "Bye!"
fi


exit
