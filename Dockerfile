FROM ubuntu:latest


ARG DEBIAN_FRONTEND=noninteractive


# Instalação de dependências básicas

RUN apt-get update && apt-get install -y \

    curl \

    unzip \

    openjdk-17-jdk \

    git \

    maven \

    npm \

    && apt-get clean \

    && rm -rf /var/lib/apt/lists/*


# Instalação do nvm para gerenciar o Node.js

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \

    && export NVM_DIR="$HOME/.nvm" \

    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \

    && nvm install node \

    && npm install -g npm \

    && npm install -g appium \

    && appium driver install uiautomator2


# Configuração das variáveis de ambiente para o Android SDK

ENV ANDROID_HOME=/Android/Sdk

ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/30.0.3


# Download e configuração do Android SDK

RUN mkdir -p $ANDROID_HOME \

    && curl -o sdk-tools-linux.zip https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip?hl=pt-br \

    && unzip sdk-tools-linux.zip -d $ANDROID_HOME \

    && mv $ANDROID_HOME/cmdline-tools $ANDROID_HOME/cmdline-tools-latest \

    && mkdir -p $ANDROID_HOME/cmdline-tools/latest \

    && mv $ANDROID_HOME/cmdline-tools-latest/* $ANDROID_HOME/cmdline-tools/latest \

    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "platform-tools" \

    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "emulator" \

    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "build-tools;30.0.3" \

    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platforms;android-27" \

    && yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --install "system-images;android-27;google_apis_playstore;x86"


# Criação do AVD para o emulador Android

RUN echo "no" | avdmanager create avd -n device-1 -k "system-images;android-27;google_apis_playstore;x86" -d pixel_4


# Copia o diretório web-view para dentro do contêiner

COPY web-view /web-view


# Define o diretório de trabalho como /web-view

WORKDIR /web-view


# Instala as dependências do projeto Node.js

RUN yes | npm install

# Inicia o servidor e o emulador Android

CMD rm -rf $HOME/.android/avd/device-1.avd/*.lock \

    && rm -rf $ANDROID_HOME/avd/device-1.avd/*.lock \
    && tail -f /dev/null

RUN yes | apt-get update 
RUN apt install nano
