#!/bin/bash

# resize icons
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 38

# Turn panel mode is off
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Put dock to left
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'

# Turn autohide to off
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false

echo "Dock setting complete!"