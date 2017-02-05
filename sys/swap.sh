#!/bin/bash

# Last used: Ubuntu 16.04
# USAGE: after chmoding script type
# ./serverBlock.sh <your-domain-here>

# Check swap
sudo swapon --show && free -h

# Check available apace on the hard drive partition
df -h

# Create swapfile
sudo fallocate -l 1G /swapfile
# Verify ammount
ls -lh /swapfile
# Make the file only accessible to root by typing:
sudo chmod 600 /swapfile
# Verify permissions
ls -lh /swapfile

# Mark and enable swap file
sudo mkswap /swapfile
sudo swapon /swapfile

# Verify that swap is available
sudo swapon --show && free -h

# Make the Swap File Permanent
# Back up the /etc/fstab file in case anything goes wrong:
sudo cp /etc/fstab /etc/fstab.bak
# Add the swap file information to the end of your /etc/fstab file by typing:
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab


# Swappines setting
cat /proc/sys/vm/swappiness
# Set swappines to 10
sudo sysctl vm.swappiness=10
# Make it Permanent
sudo nano /etc/sysctl.conf
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf