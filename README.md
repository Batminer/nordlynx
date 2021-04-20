# nordlynx
docker to extract wg-config of nordlynx 

This is what I scraped from the interwebs....

NordVPN Wireguard Setup Works
Thought i'd pass on this little tip.

For
 those that use NordVPN, you probably already know that they refuse to 
provide the required configuration for setting up WireGuard on routers. 
However it's relatively easy to extract it (if laborious)

You need a Linux PC so either use an existing one or build a vm

install WireGuard

install NordVPN as per the instructions on their website

Configure NordVPN to use WireGuard (nordvpn set technology nordlynx)

connect to NordVPN to your desired server

Use the WireGuard tools to dump the config (wg show and wg showconf nordlynx )

Get your private IP from ifconfig / ip addr depending on your version of linux

You
 should now have all the information you need - your private key and 
assigned IP. I put all this in the relevant section in pfSense it worked
 perfectly.  The only thing I did was change the mask on the assigned ip
 from a /16 to a /32

It's a bit of mucking around however it's worth it. Both results below are the same server

OpenVPN: https://www.speedtest.net/result/11052876737

WireGuard: https://www.speedtest.net/result/11052862201

Edit:
 It appears that NordVPN uses the same keys and private IP for every 
session you have - even on different PC's. So it will be impossible to 
configure more than one NordVPN client tunnel on pfsense.

A screenshot showing what to copy where
https://imgur.com/a/j8ttO77

