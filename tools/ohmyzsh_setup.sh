#!/bin/bash

if ! command -v zsh &> /dev/null
then
    echo "Zsh is not found, installing.."
    sudo apt update
    sudo apt install zsh -y
else
    echo "Zsh already installed."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]
then
    echo "Oh My Zsh Not found, installing.."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    if [ "$(echo $SHELL)" != "$(which zsh)" ]
    then
        echo "Shell changing to Zsh.."
        chsh -s $(which zsh)
    else
        echo "Zsh is already the general shell."
    fi
    
else
    echo "Oh My Zsh already installed"
fi

echo "Oh My Zsh installed, if you want to configure please check github page.."
