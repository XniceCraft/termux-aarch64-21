#!/data/data/com.termux/files/usr/bin/bash
apt update
apt install wget gnupg -y
mkdir -p $PREFIX/etc/apt/

#Adding repo  to source.list
echo "deb https://xnicecraft.github.io/termux-aarch64-21 stable main" >> $PREFIX/etc/apt/sources.list

#Download the public key
wget -q https://xnicecraft.github.io/termux-aarch64-21/key.public

#Install the key
echo "Installing key"
apt-key add key.public
rm key.public

#Update apt
apt update
