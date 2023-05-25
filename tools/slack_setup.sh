#!/bin/bash

# Install Slack
sudo apt update
sudo apt install -y curl apt-transport-https wget

curl https://downloads.slack-edge.com/releases/linux/4.32.122/prod/x64/slack-4.32.122-0.1.el8.x86_64.rpm -o slack-desktop.deb
sudo apt install -y ./slack-desktop.deb

# Clean up
rm -f slack-desktop.deb
