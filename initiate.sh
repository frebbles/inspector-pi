#!/bin/bash

# Setup script for creating inspector-pi
# AP and Bridge instruction from https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md
#
# Author: frebbles

echo "Updating system and installing required packages"
#apt update
#apt upgrade
apt install hostapd dnsmasq bridge-utils tcpdump wireshark

echo "Stop system processes we are about to configure"
systemctl stop dnsmasq
systemctl stop hostapd

echo "Configuring static IP"
cp etc-dhcpcd.conf /etc/dhcpcd.conf
service dhcpcd restart

echo "Configuring DHCP server"
cp etc-dnsmasq.conf /etc/dnsmasq.conf
systemctl start dnsmasq

echo "Configuring NAT Routing / MASQUERADE"
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sh -c "iptables-save > /etc/iptables.ipv4.nat"

sed -i '/exit 0/ i iptables-restore < /etc/iptables.ipv4.nat' /etc/rc.local

echo "Configuring Bridging"
brctl addbr br0
brctl addif br0 eth0

systemctl restart systemd-networkd

echo "Configuring Host APD"
cp etc-hostapd-hostapd.conf /etc/hostapd/hostapd.conf
echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd
systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd

#echo "System Status"
#systemctl status hostapd
#systemctl status dnsmasq
