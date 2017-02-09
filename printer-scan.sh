#!/bin/bash

# This script uses nmap (nmap.org) to scan an individual network, or a list file of
# networks for network printers and outputs results to the local directory. An example list
# file should look like: 192.168.1.0/24
#                        128.167.1.0/17
#                        10.10.10.2/16
# The success of this script relies on ports 9100, 515 or 631 being open on the network
# attached printers being scaned.
#
# Justin Gulley

options=("Individual Network Scan" "From File" "Quit")
select i in "${options[@]}"; do
   if [ "$i" = "Quit" ]; then
      echo Done
      exit

#Scan individual network
   elif [ "$i" = "Individual Network Scan" ]; then
      echo Enter network e.g. 192.168.1.1: 
      read NETWORK
      echo Enter CIDR notation e.g. /24: 
      read CIDR
      sudo nmap -sS -Pn $NETWORK$CIDR -p9100,631,515 --open > $NETWORK-"$(date +%Y%m%d_%H:%M)".scan
      echo Done
      echo

#Scan networks from file.
   elif [ "$i" = "From File" ]; then
      echo Enter filename: 

      read FILE
      sudo nmap -sS -Pn -iL $FILE -p9100,631,515 --open > $FILE-"$(date +%Y%m%d_%H:%M)".scan
      echo Done

#For selection errors
   else
      clear
      echo Bad Option

   fi
break
done
