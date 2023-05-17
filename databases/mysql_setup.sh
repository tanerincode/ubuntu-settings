#!/bin/bash

# Check if MySQL is already installed
if ! command -v mysql &> /dev/null
then
    echo "MySQL is not found, installing..."

    # Update the package list
    sudo apt-get update

    # Install MySQL
    sudo apt-get install -y mysql-server
else
    echo "MySQL is already installed."
fi

echo "MySQL installation process is complete!"
