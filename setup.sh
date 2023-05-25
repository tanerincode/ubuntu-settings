#!/bin/bash

# Define some colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Spinner function
spinner() {
    local pid=$1
    local delay=0.25
    local spinstr='|/-\'
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf " [%c] " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Give execution permissions to all the setup scripts
chmod +x ./languages/*.sh
chmod +x ./databases/*.sh
chmod +x ./IDE/*.sh
chmod +x ./system/*.sh
chmod +x ./customize/*.sh
chmod +x ./tools/*.sh

echo -e "${GREEN}Welcome to the setup script${NC}"

# Run setup scripts without asking user
code --version > /dev/null 2>&1 || (./IDE/vscode_setup.sh & spinner $!)
# LANGUAGES
node --version > /dev/null 2>&1 || (./languages/nodejs_setup.sh & spinner $!)
go version > /dev/null 2>&1 || (./languages/go_setup.sh & spinner﻿
# RUN TOOLS
which slack > /dev/null 2>&1 || (./tools/slack_setup.sh & spinner $!)
[ -d "$HOME/.oh-my-zsh" ] || (./tools/ohmyzsh_setup.sh & spinner $!)

# CUSTOMIZE
./customize/dock_setup.sh & spinner $!

echo -e "${GREEN}Setup process is complete!${NC}"
