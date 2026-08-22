#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
apt update
apt full-upgrade -y
grep -v '^#' ./ubuntu-1404.packages | xargs apt install -y
