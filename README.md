# inspector pi

An easy setup pi script to create an Access Point out of a Raspberry Pi with Ethernet shared internet connection, and to inspect the traffic going across it.

## Installation/Setup

1. Start with a fresh "noobs" or Raspbian desktop and connect to the internet with either Wifi or Ethernet (Note: wifi will no longer be available post-script)
2. run ```sudo ./initiate.sh```
3. Restart the pi for best results, but it should be good to connect to


## Quick tcpdump Guide

Quick view in full verbosity
```
tcpdump -vvv -i br0
```

View packets larger than 1024 bytes
```
tcpdump -vvv -i br0 -nn greater 1024
```

Filter out traffic from a noisy host
```
tcpdump -i eth0 not host 10.99.231.76
```

Write to file
```
tcpdump -w mytcpdumpoutput
```

Read from file
```
tcpdump -r ./mytcpdumpoutput
```

Filter udp traffic
```
tcpdump udp port 53
```

Filter traffic between two hosts
```
tcpdump host 192.241.213.28 and host 205.204.33.32
```
