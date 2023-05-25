#!/bin/bash

# Install gdebi-core if not already installed
which gdebi > /dev/null 2>&1 || sudo apt-get install gdebi-core

# Download and install the latest version of GitHub Desktop
wget https://github.com/shiftkey/desktop/releases/download/release-3.1.1-linux1/GitHubDesktop-linux-3.1.1-linux1.deb
sudo gdebi --non-interactive GitHubDesktop-linux-3.1.1-linux1.deb

# Remove the downloaded file
rm GitHubDesktop-linux-3.1.1-linux1.deb
