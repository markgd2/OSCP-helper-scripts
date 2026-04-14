#! /bin/bash

# =====================Script to create directory for a practice box=====================
# This script conveniently takes a string as input, creates a new dir named after that
# string, and adds in the scripts I'd need. So far this is just my rustscan/nmap script 
# (nmap_tcp.sh), but there should be more added overtime. 

# Verify num of inputs = 1
if [ $# = 1 ]; then
	echo "[INFO] Confirmed box name = $1"
else
	echo "[ERROR] Usage: ./newbox.sh <box name>"
	exit 1
fi

# Assign input to newbox
newbox=$1

# Make new directory
echo "[INFO] Making new directory..."
mkdir $newbox

# Copy over scanning scripts to new directory
echo "[INFO] Copying scripts over from ~/OSCP/Scripts"
cd $newbox
# Change this to point to your own scripts folder if you somehow use my script :)
cp /home/kali/OSCP/Scripts/* .
chmod +x *

# TODO:
# 1. Add a -scan flag that enables input of an IP address to scan, then automatically run nmap_tcp.sh with the given IP
