#!/bin/bash

echo "Starting the swap creation process..."

# Check swap
echo "Checking swap..."
swapon -s

# Create swap 1GB
echo "Creating 1GB swap file..."
dd if=/dev/zero of=/mnt/swapfile bs=1024 count=1024k

# Create swap
echo "Setting up swap file..."
mkswap /mnt/swapfile

# Enable swap
echo "Enabling swap..."
swapon /mnt/swapfile

# Check swap
echo "Checking swap..."
swapon -s

# Add to /etc/fstab
echo "Adding swap file to /etc/fstab..."
echo /mnt/swapfile none swap defaults 0 0 >> /etc/fstab

# Set permissions to root and set chmod 600
echo "Setting permissions on swap file..."
chown root:root /mnt/swapfile
chmod 0600 /mnt/swapfile

# Show swappiness
echo "Checking swappiness..."
cat /proc/sys/vm/swappiness

# Set swappiness
echo "Setting swappiness to 50..."
sysctl vm.swappiness=50

# Change swappiness amount 50 = 50% of ram used before swap
echo "Adding swappiness setting to /etc/sysctl.conf..."
echo vm.swappiness = 50 >> /etc/sysctl.conf

# Check swap
echo "Checking swap..."
swapon -s

# Check swappiness
echo "Checking swappiness..."
cat /proc/sys/vm/swappiness

# Reboot
echo -e "\e[1;32mSwap created and started at boot. Reboot now and check swap afterwards with \"swapon -s\" and \"cat /proc/sys/vm/swappiness\" to check swappiness.\e[0m"

