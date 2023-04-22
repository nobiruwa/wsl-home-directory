#!/usr/bin/env bash

IP=$(ip addr show dev eth0 | grep 'inet ' | awk '{print $2}' | sed -r 's/\/[0-9][0-9]?$//')


echo "${IP}" | tee /tmp/update-ssh-port-forwarding.log

echo 1. delete netsh rule | tee -a /tmp/update-ssh-port-forwarding.log
netsh.exe interface portproxy delete v4tov4 listenport=22 | tee -a /tmp/update-ssh-port-forwarding.log

echo 2. add netsh rule | tee -a /tmp/update-ssh-port-forwarding.log
netsh.exe interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=22 connectaddress=$IP connectport=22 | tee -a /tmp/update-ssh-port-forwarding.log

echo 3. apply netsh rule | tee -a /tmp/update-ssh-port-forwarding.log
sc.exe config iphlpsvc start=auto | tee -a /tmp/update-ssh-port-forwarding.log

echo 4. start netsh rule | tee -a /tmp/update-ssh-port-forwarding.log
sc.exe stop   iphlpsvc | tee -a /tmp/update-ssh-port-forwarding.log
sc.exe start  iphlpsvc | tee -a /tmp/update-ssh-port-forwarding.log

echo 6. open firewall | tee -a /tmp/update-ssh-port-forwarding.log
netsh.exe advfirewall firewall add rule name="Open Port 22 for WSL2" dir=in action=allow protocol=TCP localport=22

echo 5. show netsh rule status | tee -a /tmp/update-ssh-port-forwarding.log
netsh.exe interface portproxy show all | tee -a /tmp/update-ssh-port-forwarding.log
