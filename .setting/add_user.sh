#!/usr/bin/env bash
groupadd $1
useradd -m -p $2 $1 -g $1 -s /bin/bash
echo "$1:$2" | chpasswd
echo "$1 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
