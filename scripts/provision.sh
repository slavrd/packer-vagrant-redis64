#!/usr/env/bin bash
# Installs redis
# useage: provision.sh [redis_version]

apt-get clean
apt-get update

# Install redis
if [ "$1" == "auto" ] || [ "$1" == "" ]; then
    apt-get install -y redis-server
else
    apt-get install -y redis-server=$1
fi

apt-get autoremove -y
apt-get clean

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Zero out the free space to save space in the final image:
echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
