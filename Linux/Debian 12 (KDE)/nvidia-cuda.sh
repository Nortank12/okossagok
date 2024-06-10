#!/bin/bash

# Check root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Prepare Debian
apt install linux-headers-$(uname -r)
add-apt-repository contrib
apt-key del 7fa2af80

# Install keyring
curl -fsSLo https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
rm cuda-keyring_1.1-1_all.deb

# Install CUDA drivers
apt update
apt install cuda
