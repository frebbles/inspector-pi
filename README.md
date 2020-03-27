= inspector pi

An easy setup pi script to create an Access Point out of a Raspberry Pi with Ethernet shared internet connection, and to inspect the traffic going across it.

- Quick TCPDUMP Guide

tcpdump -vvv -i br0

tcpdump -vvv -i br0 -nn greater 1024

tcpdump -i eth0 not host 10.99.231.76

Write to file
tcpdump -w mytcpdumpoutput

Read from file
tcpdump -r ./mytcpdumpoutput

tcpdump udp port 53

tcpdump host 192.241.213.28 and host 205.204.33.32

tcpdump -nn host 192.241.213.28 and host 205.204.33.32
