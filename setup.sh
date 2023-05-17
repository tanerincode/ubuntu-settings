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

echo -e "${GREEN}Welcome to the setup script${NC}"

# Keep asking for valid input for the programming language
while true; do
    echo -e "${BLUE}Select the programming language you want to set up (or 0 to skip):${NC}"

    echo "0. Skip"

    # Check if Node.js is installed
    node --version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${RED}1. Node.js (already installed)${NC}"
    else
        echo "1. Node.js"
    fi

    # Check if Go is installed
    go version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${RED}2. Go (already installed)${NC}"
    else
        echo "2. Go"
    fi

    # Check if PHP is installed
    php --version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${RED}3. PHP (already installed)${NC}"
    else
        echo "3. PHP"
    fi

    read -p "Enter the number of your selection: " language_selection

    case $language_selection in
        0)
            break
            ;;
        1)
            ./languages/nodejs_setup.sh &
            spinner $!
            break
            ;;
        2)
            ./languages/go_setup.sh &
            spinner $!
            break
            ;;
        3)
            ./languages/php_setup.sh &
            spinner $!
            while true; do
                echo -e "${BLUE}Select the web server you want to set up for PHP (or 0 to skip):${NC}"
                echo "0. Skip"

                # Check if Apache is installed
                apachectl -v > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    echo -e "${RED}1. Apache (already installed)${NC}"
                else
                    echo "1. Apache"
                fi

                # Check if Nginx is installed
                nginx -v > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    echo -e "${RED}2. Nginx (already installed)${NC}"
                else
                    echo "2. Nginx"
                fi

                read -p "Enter the number of your selection: " server_selection

                case $server_selection in
                    0)
                        break
                        ;;
                    1)
                        ./system/apache_setup.sh &
                        spinner $!
                        break
                        ;;
                    2)
                        ./system/nginx_setup.sh &
                        spinner $!
                        break
                        ;;
                    *)
                        echo -e "${RED}Invalid selection. Please enter a number between 0 and 2.${NC}"
                        ;;
                esac
            done
            break
            ;;
        *)
            echo -e "${RED}Invalid selection. Please enter a number between 0 and 3.${NC}"
            ;;
    esac
done

# Ask for the database
while true; do
    echo -e "${BLUE}Select the database you want to set up (or 0 to skip):${NC}"
    echo "0. Skip"

    # Check if MySQL is installed
    mysql --version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${RED}1. MySQL (already installed)${NC}"
    else
        echo "1. MySQL"
    fi

    # Check if MongoDB is installed
    mongod --version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${RED}2. MongoDB (already installed)${NC}"
    else
        echo "2. MongoDB"
    fi

    # Check if PostgreSQL is installed
    psql --version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${RED}3. PostgreSQL (already installed)${NC}"
    else
        echo "3. PostgreSQL"
    fi

    read -p "Enter the number of your selection: " db_selection

    case $db_selection in
        0)
            break
            ;;
        1)
            ./databases/mysql_setup.sh &
            spinner $!
            break
            ;;
        2)
            echo "Installing MongoDB..."
            ./databases/mongodb_setup.sh > /dev/null 2>&1 &
            spinner $!
            echo "MongoDB installation complete!"
            break
            ;;
        3)
            ./databases/postgresql_setup.sh &
            spinner $!
            break
            ;;
        *)
            echo -e "${RED}Invalid selection. Please enter a number between 0 and 3.${NC}"
            ;;
    esac
done

# Ask if the user wants to install Oh My Zsh
while true; do
    echo -e "${BLUE}Would you like to install Oh My Zsh? (or 0 to skip):${NC}"
    echo "0. Skip"

    # Check if Oh My Zsh is installed
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${RED}1. Oh My Zsh (already installed)${NC}"
    else
        echo "1. Install Oh My Zsh"
    fi

    read -p "Enter the number of your selection: " ohmyzsh_selection

    case $ohmyzsh_selection in
        0)
            break
            ;;
        1)
            ./system/ohmyzsh_setup.sh &
            spinner $!
            break
            ;;
        *)
            echo -e "${RED}Invalid selection. Please enter 0 or 1.${NC}"
            ;;
    esac
done

while true; do
    echo -e "${BLUE}Would you like to customize dock? (or 2 to skip):${NC}"
    echo -e "1. Yes"
    echo -e "2. No"

    read -p "Enter the number of your selection: " dock_edit

    case $dock_edit in
        1)
            break
            ;;
        2)
            ./system/dock_setup.sh &
            spinner $!
            break
            ;;
        *)
            echo -e "${RED}Invalid selection. Please enter 1 or 2.${NC}"
            ;;
    esac
done

echo -e "${GREEN}Setup process is complete!${NC}"
