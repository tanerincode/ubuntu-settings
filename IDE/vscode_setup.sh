#!/bin/bash

# Check if Visual Studio Code is already installed
if ! command -v code &> /dev/null
then
    echo "Visual Studio Code is not found, installing..."

    # Download the Visual Studio Code .deb package
    curl -L "https://go.microsoft.com/fwlink/?LinkID=760868" -o vscode.deb

    # Install Visual Studio Code
    sudo dpkg -i vscode.deb

    # Remove the .deb package file
    rm vscode.deb
else
    echo "Visual Studio Code is already installed."
fi

echo "Visual Studio Code installation process is complete!"
