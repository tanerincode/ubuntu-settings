#!/bin/bash

# Check if Nginx is already installed
if ! command -v nginx &> /dev/null
then
    echo "Nginx is not found, installing..."

    # Update the package list
    sudo apt-get update

    # Install Nginx
    sudo apt-get install -y nginx
else
    echo "Nginx is already installed."
fi

echo "Nginx installation process is complete!"
