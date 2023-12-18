#!/data/data/com.termux/files/usr/bin/bash

echo "Installing the repo!"

apt update
apt install gnupg -y
mkdir -p /data/data/com.termux/files/usr/etc/apt/keyrings

# Install the key
curl https://xnicecraft.github.io/termux-aarch64-21/key.public | gpg --dearmor -o /data/data/com.termux/files/usr/etc/apt/keyrings/xnicecraft-repo.gpg

# Remove repo source if exists
sed -i -E "s;deb (\[(.+)\] )?https://xnicecraft.github.io/termux-aarch64-21 stable main;;g" /data/data/com.termux/files/usr/etc/apt/sources.list

# Adding repo to source.list
echo "deb [signed-by=/data/data/com.termux/files/usr/etc/apt/keyrings/xnicecraft-repo.gpg] https://xnicecraft.github.io/termux-aarch64-21 stable main" >> /data/data/com.termux/files/usr/etc/apt/sources.list

# Update the package list
apt update

echo "Done!"
