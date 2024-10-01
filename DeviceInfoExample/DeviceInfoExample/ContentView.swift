//
//  ContentView.swift
//  DeviceInfoExample
//
//  Created by 王楚江 on 2024/10/2.
//

import SwiftUI
import DeviceInfo

struct ContentView: View {
    var body: some View {
        
        List {
            #if os(macOS)
            Image(nsImage: DeviceInfo.appIcon)
            #endif
            #if os(iOS)
            if let icon = DeviceInfo.appIcon {
                Image(uiImage: icon)
            }
            #endif
            LabelCaption(content: "bundleName") {
                Text("\(DeviceInfo.bundleName)")
            }
            
            LabelCaption(content: "bundleIdentifier") {
                Text("\(DeviceInfo.bundleIdentifier)")
            }
            
            LabelCaption(content: "bundleVersion") {
                Text("\(DeviceInfo.bundleVersion)")
            }
            
            LabelCaption(content: "version") {
                Text("\(DeviceInfo.version)")
            }
            
            LabelCaption(content: "isDarkMode") {
                Text("\(String(describing: DeviceInfo.isDarkMode))")
            }
            
            LabelCaption(content: "osName") {
                Text("\(String(describing: DeviceInfo.osName))")
            }
            
            LabelCaption(content: "systemVersionString") {
                Text("\(String(describing: DeviceInfo.systemVersionString))")
            }
            
            LabelCaption(content: "systemVersionString") {
                Text("\(String(describing: DeviceInfo.systemVersionString))")
            }
            
            LabelCaption(content: "systemMajorVersion") {
                Text("\(String(describing: DeviceInfo.systemMajorVersion))")
            }
            LabelCaption(content: "systemMinorVersion") {
                Text("\(String(describing: DeviceInfo.systemMinorVersion))")
            }
            LabelCaption(content: "systemPatchVersion") {
                Text("\(String(describing: DeviceInfo.systemPatchVersion))")
            }
            
        }
        .textSelection(.enabled)
    }
}
