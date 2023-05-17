#!/bin/bash

# Check if PHP is already installed
if ! command -v php &> /dev/null
then
    echo "PHP is not found, installing..."

    # Ask the user for the PHP version they want to install
    read -p "Please enter the version of PHP you want to install (leave empty for latest version): " PHP_VERSION

    # If no version specified, use the latest stable version (as of the time of writing this script, it's 7.4)
    if [ -z "$PHP_VERSION" ]
    then
        PHP_VERSION="8.3"
    fi

    # Add the ondrej/php repository which has the PHP version packages
    sudo add-apt-repository ppa:ondrej/php -y

    # Update the package list
    sudo apt-get update

    # Install PHP
    sudo apt-get install -y php$PHP_VERSION
else
    echo "PHP is already installed."
fi

echo "PHP installation process is complete!"
