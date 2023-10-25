#!/bin/bash

install_package () {
 sudo apt-get install ${package_name}
 if [ $? -eq 0 ]; then
    echo "All good!"
 else
    echo "Fuuuuck..."
    exit 1
 fi
}

check_package () {
    read -p "Enter package-name: " package_name
    if dpkg -l | grep -q "^ii  $package_name "; then
        echo "$package_name is installed."
    else
        read -p "$package_name is not installed. Do you want to install it? Y/N " install_service
        if [[ "$install_service" == "Y" ]]; then
            install_package ${package_name}
        else
            exit 0
        fi
    fi
}

# Usage example: Check if 'curl' is installed
check_package "${package_name}"