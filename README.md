# docker-android
Easily start an Android emulator, Appium server, and Maven in Docker for mobile testing
# Use example
`ssudo docker run -d --privileged --name your-container-name fahleiro/docker-android:1.0`

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

Exit container and execute `docker cp android-emulator-container:/screenshot.png ~/Desktop/screenshot.png`

_captured screenshot moved to your Desktop_

# Dependencies
- curl
- unzip
- openjdk-17-jdk
- Node.js /  npm
- Appium
- uiautomator2
- Android SDK
- Android Emulator
- Android Platform-Tools
- Android Build-Tools
- Android System Images
