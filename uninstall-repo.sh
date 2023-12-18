#!/data/data/com.termux/files/usr/bin/bash

: "${PREFIX:=/data/data/com.termux/files/usr}"
# Remove from /etc/apt/keyrings
if [[ -f "${PREFIX}/etc/apt/keyrings/xnicecraft-repo.gpg" ]]; then
    echo "Removing key at ${PREFIX}/etc/apt/keyrings/xnicecraft-repo.gpg"
    rm -f "${PREFIX}/etc/apt/keyrings/xnicecraft-repo.gpg"
fi

# Remove key from apt-key
if [[ $(command -v apt-key) ]]; then
    key_id=$(apt-key list | grep "X-Nice Craft" -B 1 | grep -E "([0-9a-zA-Z]{4}\s){4}")
    if [[ -n "${key_id}" ]]; then
        apt-key del "${key_id}"
        echo "Removing the public key from apt-key!"
    fi
fi

# Remove from apt source
sed -i -E "s;deb (\[(.+)\] )?https://xnicecraft.github.io/termux-aarch64-21 stable main;;g" "${PREFIX}/etc/apt/sources.list"

echo "Done!"
