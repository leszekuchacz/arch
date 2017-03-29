#!/bin/bash


lista="c7 c6 c5 c4 c3 c2 c1 c0 bd bc bb ba b9 b8 b7 b6 b5 b4 b3 b2 b1 b0 ad ac ab aa a9 a8 a7 a6 a5 a4 a3 a2 a1 a0 9d 9c 9b 9a 99 98 97 96 95 94 93 92 91 90 8d 8c 8b 8a"
i=0
for a in $lista
do
    i=$(($i+1))
    echo $i
    ifconfig enp7s0 down
    echo "killall  dhcpcd"
    killall dhcpcd
    sleep 1
    echo "change mac"
    ifconfig enp7s0 hw ether f0:1f:af:66:f0:$a 
    sleep 1
    echo "--  up --"
    ifconfig enp7s0 up
    sleep 1
    dhcpcd
    sleep 10
    ifconfig enp7s0
done
