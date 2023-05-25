#!/bin/bash

# Check if MongoDB is already installed
if ! command -v mongo &> /dev/null
then
    echo "MongoDB is not found, installing..."

    # Download MongoDB
    wget -qO - https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2204-6.0.6.tgz | tar xz

    # Move MongoDB files to the appropriate directories
    sudo mv mongodb-linux-x86_64-ubuntu2204-6.0.6/bin/* /usr/local/bin/

    # Create the data directory
    sudo mkdir -p /data/db

    # Set permissions for the data directory
    sudo chown -R `id -un` /data/db
else
    echo "MongoDB is already installed."
fi

echo "MongoDB installation process is complete!"
