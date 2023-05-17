#!/bin/bash

# Check if JetBrains Toolbox is already installed
if [ ! -d $HOME/.local/share/JetBrains/Toolbox ]
then
    echo "JetBrains Toolbox is not found, installing..."

    # Download the Toolbox tar.gz file
    curl -L "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.28.1.15219.tar.gz" -o toolbox.tar.gz

    # Extract the Toolbox tar.gz file
    tar -xzf toolbox.tar.gz -C $HOME/.local/share

    # Remove the tar.gz file
    rm toolbox.tar.gz

    # Run the Toolbox
    nohup "$HOME/.local/share/jetbrains-toolbox-1.21.9712/jetbrains-toolbox" &>/dev/null &
else
    echo "JetBrains Toolbox is already installed."
fi

echo "JetBrains Toolbox installation process is complete!"
