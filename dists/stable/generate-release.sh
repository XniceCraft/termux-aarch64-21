#!/bin/bash
set -e

do_hash() {
    HASH_NAME=$1
    HASH_CMD=$2
    echo "${HASH_NAME}:"
    for f in $(find -type f); do
        if [[ ! $f =~ "generate-release.sh" ]] && [[ ! $f =~ "index.html" ]]; then
            f=$(echo $f | cut -c3-) # remove ./ prefix
            if [ "$f" = "Release" ]; then
                continue
            fi
            echo " $(${HASH_CMD} ${f}  | cut -d" " -f1) $(wc -c $f)"
        fi
    done
}

cat << EOF
Origin: termux
Label: termux
Suite: stable
Codename: stable
Architectures: aarch64
Components: main
Description: APT Repo by X-Nice Craft for Android 5+
Date: $(date -Ru)
EOF
do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"
do_hash "SHA512" "sha512sum"

