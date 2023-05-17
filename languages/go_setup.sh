#!/bin/bash

# Check if Go is already installed
if ! command -v go &> /dev/null
then
    echo "Go is not found, installing..."

    # Ask the user for the Go version they want to install
    read -p "Please enter the version of Go you want to install (leave empty for latest version): " GO_VERSION

    # If no version specified, use the latest stable version
    if [ -z "$GO_VERSION" ]
    then
        # Get the latest version of Go from the official website
        GO_VERSION=$(curl 'https://golang.org/VERSION?m=text' | sed 's/go//')
    fi

    # Download Go
    curl -O https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz

    # Extract Go archive
    sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz

    # Remove Go archive
    rm go$GO_VERSION.linux-amd64.tar.gz

    # Add Go to PATH
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

    # Apply the new PATH immediately
    source ~/.bashrc
else
    echo "Go is already installed."
fi

echo "Go installation process is complete!"
