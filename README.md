This script uses nmap (nmap.org) to scan an individual network, or a list file of
networks for network printers and outputs results to the local directory. An example list
file should look like: 192.168.1.0/24
                       128.167.1.0/17
                       10.10.10.2/16
The success of this script relies on ports 9100, 515 or 631 being open on the network
attached printers being scaned.

-JOG
