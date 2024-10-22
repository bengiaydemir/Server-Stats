#!/bin/bash

echo "-----Server Performance Stats of Kali Linux-----"

# calculating total CPU usage
top -bn1 | grep "Cpu(s) | awk '{print "Total CPU Usage: " $2 + $4"%"}'

# calculating total memory usage
top -bn1 | grep "KiB Mem" | awk '{print "Memory Usage: " $8 "MB / " $4 "MB (" ($8*100/$4) "%)"}'

# calculating total disk usage, $3=used, $=2total, $5=percentage
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}

# displaying top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# displaying top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

# displaying operating system version
echo "Operating System Version:"
cat /etc/os-release | grep 'PRETTY_NAME' | cut -d= -f2

# displaying uptime
echo "Uptime:"
uptime -p

echo "------------------------------------------------"
