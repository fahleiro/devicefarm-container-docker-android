FROM ubuntu:latest


ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \

    curl \

    unzip \

    openjdk-17-jdk \

    && apt-get clean \

    && rm -rf /var/lib/apt/lists/*


RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \

    && export NVM_DIR="$HOME/.nvm" \

    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \

    && nvm install node \

    && npm install -g npm \

    && npm install -g appium \

    && appium driver install uiautomator2


ENV ANDROID_HOME=$HOME/Android/Sdk

ENV ANDROID_SDK_ROOT=$ANDROID_HOME

ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/30.0.3


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


RUN echo "no" | avdmanager create avd -n device-1 -k "system-images;android-27;google_apis_playstore;x86" -d pixel_4


CMD emulator -avd device-1 -port 5554 -no-audio -no-boot-anim -no-window
