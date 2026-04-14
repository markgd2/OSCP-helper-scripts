#! /bin/bash

# This script is for my default OSCP rust scan & then nmap scans that I do.

# Verifying sudo
if [[ $EUID -ne 0 ]]; then
   echo "[!] This script must be run with sudo!" 
   exit 1
fi

# Verifying input
if [ $# = 1 ]; then
	echo '[*] 1 Argument loaded'
else
	echo '[!] Usage: ./namp_tcp.sh <target_ip>'
	exit 1
fi

# Setting Target to input
echo -e "[*] Setting target = \e[31m$1\e[0m"
target=$1


# Rustscan first...
echo "[*] Running rustscan on $target..."
echo "===================================================================="
rustscan -a $target --ulimit 5000 -r 1-65535

# After rustscan is done
# Run nmap full scan
echo "[*] Rustscan done, now running nmap on $target..."
echo "===================================================================="
sudo nmap -Pn -sVC -p- -v -T4 -sT --open $target -oN results_nmap

# TODO:
# 1. Incorporate Feroxbuster thread to directory bust after rustscan finds tcp port 80
# 2. Incorporate Feroxbuster thread to dir bust aft nmap finds a
#    http service aside from port 80
# 3. Make rustscan and my own nmap scan run simultaneously by running nmap in background
