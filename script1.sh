#!/bin/bash

set -e

apt update
apt install -y iptables

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/16 -j MASQUERADE

echo "NAT MASQUERADE applied on IronMan"
