#!/bin/bash

# Check if MongoDB is already installed
if ! command -v mongo &> /dev/null
then
    echo "MongoDB is not found, installing..."

    # Import the public key used by the package management system
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

    # Create a list file for MongoDB
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

    # Reload local package database
    sudo apt-get update

    # Install the MongoDB packages
    sudo apt-get install -y mongodb-org
else
    echo "MongoDB is already installed."
fi

echo "MongoDB installation process is complete!"
