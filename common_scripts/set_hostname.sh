#!/bin/bash
echo $1 > /etc/hostname
sed -i "2i $(/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}') $2 $1" /etc/hosts
