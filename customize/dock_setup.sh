#!/bin/bash

# Define some colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# resize icons
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 38

# Turn panel mode is off
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Put dock to left
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'

# Turn autohide to off
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false