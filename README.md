# docker-android
Easily start an Android emulator, Appium server, and Maven in Docker for mobile testing

[![followIn-DockerHub](https://img.shields.io/badge/followIn-DockerHub-blue?logo=docker&logoColor=white)](https://hub.docker.com/repository/docker/fahleiro/docker-android/general/ "Go to Docker homepage")

![imageBasedOn-Linux](https://img.shields.io/badge/imageBasedOn-Linux-purple?logo=linux&logoColor=white)

# Initial tips
- You can restart container any times you want, but everytime the device is started by image, this use `-no-snapshot`. So if you do it, your changes will not be saved

# Use example
`sudo docker run -d --privileged --name your-container-name fahleiro/docker-android:version`

_ps: your machine need available kvm-on_

[_see more about_](https://developer.android.com/studio/run/emulator-acceleration)

# Testing

- **Method 1 - Check on devices**

Inside container execute `adb devices` and must return some like this
```
List of devices attached
emulator-5554 device
```

- **Method 2 - Take a screenshot**

container execute `adb exec-out screencap -p > /screenshot.png`

Exit container and execute `docker cp your-container-name:/screenshot.png ~/Desktop/screenshot.png`

_captured screenshot moved to your Desktop_

# Dependencies included
- [X] curl
- [X] unzip
- [X] openjdk-17-jdk
- [X] Node.js /  npm
- [X] Appium
- [X] uiautomator2
- [X] Android SDK
- [X] Android Emulator
- [X] Android Platform-Tools
- [X] Android Build-Tools
- [X] Android System Images
- [X] maven
- [X] git
