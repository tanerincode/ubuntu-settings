#!/bin/bash

# Check if PostgreSQL is already installed
if ! command -v psql &> /dev/null
then
    echo "PostgreSQL is not found, installing..."

    # Update the package list
    sudo apt-get update

    # Install PostgreSQL
    sudo apt-get install -y postgresql postgresql-contrib
else
    echo "PostgreSQL is already installed."
fi

echo "PostgreSQL installation process is complete!"
