#!/bin/bash

# Function to parse and print the Bluetooth version based on the class part
parse_bluetooth_version() {
    local class_part="$1"
    case "$class_part" in
        0x0) echo "Bluetooth® 1.0B";;
        0x1) echo "Bluetooth® 1.1";;
        0x2) echo "Bluetooth® 1.2";;
        0x3) echo "Bluetooth® 2.0 + EDR";;
        0x4) echo "Bluetooth® 2.1 + EDR";;
        0x5) echo "Bluetooth® 3.0 + HS";;
        0x6) echo "Bluetooth® 4.0";;
        0x7) echo "Bluetooth® 4.1";;
        0x8) echo "Bluetooth® 4.2";;
        0x9) echo "Bluetooth® 5.0";;
        0xa) echo "Bluetooth® 5.1";;
        0xb) echo "Bluetooth® 5.2";;
        0xc) echo "Bluetooth® 5.3";;
        0xd) echo "Bluetooth® 5.4";;
        *) echo "Unknown";;
    esac
}

# Run btmgmt info and capture the output
btmgmt_output=$(btmgmt info | grep class)

# Extract the class value
class_value=$(echo $btmgmt_output | awk '{print $NF}')

# Extract the Bluetooth version part from the class value
version_hex=${class_value:0:3}

# Print the mapped Bluetooth version
bluetooth_version=$(parse_bluetooth_version $version_hex)
echo "Bluetooth Specification: $bluetooth_version"
