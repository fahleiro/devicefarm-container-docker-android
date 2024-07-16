#!/bin/bash


# Configuração das variáveis de ambiente para o Android SDK

export ANDROID_HOME=/Android/Sdk

export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/30.0.3


# Download e configuração do Android SDK

mkdir -p $ANDROID_HOME

curl -o sdk-tools-linux.zip https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip?hl=pt-br

unzip sdk-tools-linux.zip -d $ANDROID_HOME

mv $ANDROID_HOME/cmdline-tools $ANDROID_HOME/cmdline-tools-latest

mkdir -p $ANDROID_HOME/cmdline-tools/latest

mv $ANDROID_HOME/cmdline-tools-latest/* $ANDROID_HOME/cmdline-tools/latest


yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "platform-tools"

yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "emulator"

yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "build-tools;30.0.3"

yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platforms;android-27"

yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "system-images;android-27;google_apis_playstore;x86"


# Limpa o arquivo de instalação zip

rm sdk-tools-linux.zip
