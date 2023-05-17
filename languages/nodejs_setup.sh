#!/bin/bash

# Node.js'nin kurulu olup olmadığını kontrol edelim
if ! command -v node &> /dev/null
then
    echo "Node.js not found, installing..."

    # NodeSource deposunu ekleyelim
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

    # Node.js'yi kuralım
    sudo apt-get install -y nodejs
else
    echo "Node.js already installed."
fi

echo "Node.js installed!"
