#!/bin/bash

# Check if Apache is already installed
if ! command -v apache2 &> /dev/null
then
    echo "Apache is not found, installing..."

    # Update the package list
    sudo apt-get update

    # Install Apache
    sudo apt-get install -y apache2
else
    echo "Apache is already installed."
fi

echo "Apache installation process is complete!"
