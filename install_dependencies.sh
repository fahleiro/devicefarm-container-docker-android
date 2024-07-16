#!/bin/bash


# Atualiza a lista de pacotes

apt-get update


# Instala as dependências necessárias

apt-get install -y \

    curl \

    unzip \

    openjdk-17-jdk \

    git \

    maven \

    npm \

    nano


# Limpa o cache do apt para reduzir o tamanho da imagem

apt-get clean && rm -rf /var/lib/apt/lists/*
