DeviceInfo
===

A simple library that provides device information for iOS/macOS apps

```swift
import DeviceInfo

DeviceInfo.bundleName           // e.g "DeviceInfoExample"
DeviceInfo.bundleIdentifier     // e.g "com.wangchujiang.DeviceInfoExample"
DeviceInfo.bundleVersion        // e.g "1"
DeviceInfo.systemVersionString  // e.g "Version 15.0 (Build 24A335)"
DeviceInfo.isDarkMode           // e.g `true`
DeviceInfo.version              // e.g "1.3"
DeviceInfo.systemVersion.majorVersion        // e.g "1"
DeviceInfo.systemVersion.minorVersion        // e.g "3"
DeviceInfo.systemVersion.patchVersion        // e.g "0"
DeviceInfo.systemMajorVersion   // e.g "1"
DeviceInfo.systemMinorVersion   // e.g "3"
DeviceInfo.systemPatchVersion   // e.g "0"
```