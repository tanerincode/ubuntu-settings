#!/bin/bash

# Define some colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Show a message while waiting for a process to complete
show_message() {
    local message=$1
    local pid=$2

    # Show the message and add some dots for the waiting effect
    echo -n -e "${BLUE}$message ${NC}\n"

    # Wait for the process to complete
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 1
    done

    # Show a new line after the process completes
    echo ""
}

# Function to print a message with a border
print_message() {
    local message=$1
    local border_color=$2
    local message_color=$3

    # Calculate the length of the message plus the surrounding spaces
    local length=$((${#message} + 2))

    # Create the border line
    local border=$(printf "%${length}s" "" | tr ' ' '-')

    # Print the top border line
    echo -e "${border_color}+${border}+${NC}"

    # Print the message
    echo -e "${border_color}| ${message_color}${message}${border_color} |${NC}"

    # Print the bottom border line
    echo -e "${border_color}+${border}+${NC}"
}

# Give execution permisSetting up the docksions to all the setup scripts
chmod +x ./languages/*.sh
chmod +x ./databases/*.sh
chmod +x ./IDE/*.sh
chmod +x ./system/*.sh
chmod +x ./customize/*.sh
chmod +x ./tools/*.sh

print_message "Welcome to the setup script!" $RED $GREEN


# Run setup scripts without asking user
code --version > /dev/null 2>&1 || (./IDE/vscode_setup.sh & show_message "Installing Visual Studio Code" $!)
node --version > /dev/null 2>&1 || (./languages/nodejs_setup.sh & show_message "Installing Node.js" $!)
go version > /dev/null 2>&1 || (./languages/go_setup.sh & show_message "Installing Go" $!)

# SERVER
nginx -v > /dev/null 2>&1 || (./system/nginx_setup.sh & show_message "Installing Nginx" $!)

# DATABASES
mysql --version > /dev/null 2>&1 || (./databases/mysql_setup.sh & show_message "Installing MySQL" $!)
mongod --version > /dev/null 2>&1 || (./databases/mongodb_setup.sh & show_message "Installing MongoDB" $!)
psql --version > /dev/null 2>&1 || (./databases/postgresql_setup.sh & show_message "Installing PostgreSQL" $!)

# RUN TOOLS
which slack > /dev/null 2>&1 || (./tools/slack_setup.sh & show_message "Installing Slack" $!)
which spotify > /dev/null 2>&1 || (./tools/spotify_setup.sh & show_message "Installing Spotify" $!)
[ -d "$HOME/.oh-my-zsh" ] || (./tools/ohmyzsh_setup.sh & show_message "Installing Oh My Zsh" $!)
which github-desktop > /dev/null 2>&1 || (./tools/github_desktop_setup.sh & show_message "Installing GitHub Desktop" $!)

# CUSTOMIZE
./customize/dock_setup.sh & show_message "Setting up the dock" $!

print_message "Setup process is complete!" $RED $GREEN
