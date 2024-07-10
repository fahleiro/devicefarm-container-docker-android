# Status
![status](https://img.shields.io/badge/build-successfull-green?style=for-the-badge)

![status](https://img.shields.io/badge/test-successfull-green?style=for-the-badge)

![status](https://img.shields.io/badge/release-pending-blue?style=for-the-badge)

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
- [X] git
- [X] maven

# Changelog

## New 
**included in Dockerfile**:
  - git
  - maven

## Bugs 
**if container stop, can't intialize again**
<details>
<summary>container logs</summary>
  
```
##############################################################################
##                        WARNING - ACTION REQUIRED                         ##
##  Consider using the '-metrics-collection' flag to help improve the       ##
##  emulator by sending anonymized usage data. Or use the '-no-metrics'     ##
##  flag to bypass this warning and turn off the metrics collection.        ##
##  In a future release this warning will turn into a one-time blocking     ##
##  prompt to ask for explicit user input regarding metrics collection.     ##
##                                                                          ##
##  Please see '-help-metrics-collection' for more details. You can use     ##
##  '-metrics-to-file' or '-metrics-to-console' flags to see what type of   ##
##  data is being collected by emulator as part of usage statistics.        ##
##############################################################################
INFO    | Loading snapshot 'default_boot'...
INFO    | Cold boot based on user configuration
INFO    | Boot completed in 17747 ms
INFO    | Increasing screen off timeout, logcat buffer size to 2M.
ERROR   | Unable to connect to adb daemon on port: 5037
INFO    | Storing crashdata in: /tmp/android-unknown/emu-crash-34.2.16.db, detection is enabled for process: 7
INFO    | Android emulator version 34.2.16.0 (build_id 12038310) (CL:N/A)
INFO    | Found systemPath /Android/Sdk/system-images/android-27/google_apis_playstore/x86/
ERROR   | Running multiple emulators with the same AVD 
ERROR   | is an experimental feature.
ERROR   | Please use -read-only flag to enable this feature.
INFO    | Storing crashdata in: /tmp/android-unknown/emu-crash-34.2.16.db, detection is enabled for process: 7
INFO    | Duplicate loglines will be removed, if you wish to see each individual line launch with the -log-nofilter flag.
INFO    | Increasing RAM size to 1536MB
```

</details>

