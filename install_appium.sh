#!/bin/bash


# Instalação do nvm para gerenciar o Node.js

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash


# Carrega nvm e instala Node.js

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node


# Instala npm globalmente e Appium

npm install -g npm

npm install -g appium


# Instala o driver uiautomator2 para Appium

appium driver install uiautomator2
