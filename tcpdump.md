Capture Packet Traffic for a port
---
`tcpdump -A -s 0 'tcp port 9000 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'`
