// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#elseif canImport(WatchKit)
import WatchKit
#endif


public struct DeviceInfo {
    public init() { }
    public static let bundleName = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
    
    public static let bundleIdentifier: String = Bundle.main.bundleIdentifier!
    
    public static let bundleVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    
    public static let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
    public static let systemVersionString = ProcessInfo.processInfo.operatingSystemVersionString
    public static let systemVersion = ProcessInfo.processInfo.operatingSystemVersion
    public static let systemMajorVersion = systemVersion.majorVersion
    public static let systemMinorVersion = systemVersion.minorVersion
    public static let systemPatchVersion = systemVersion.patchVersion
    
    public static var appIsSandboxed: Bool {
        ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] != nil
    }
    
    public static let copyright = Bundle.main.object(forInfoDictionaryKey: "NSHumanReadableCopyright") as? String ?? ""
    
    /// e.g. "iOS"
    @MainActor
    public static var osName: String {
        #if canImport(UIKit)
        return UIDevice.current.systemName
        #elseif canImport(AppKit)
        "-"
        #elseif canImport(WatchKit)
        "-"
        #endif
    }

    #if canImport(UIKit)
    @available(iOS 13.0, *)
    @MainActor
    public static let isDarkMode: Bool = {
        UIApplication.isDarkMode
    }()
    #elseif canImport(AppKit)
    @available(macOS 10.14, *)
    @MainActor
    public static let isDarkMode: Bool = { NSApp?.effectiveAppearance.isDarkMode ?? false }()
    #elseif canImport(WatchKit)
    #endif
    
    #if canImport(UIKit)
    @MainActor
    public static let appIcon: UIImage? = {
        if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return UIImage(named: lastIcon)
        }
        return nil
    }()
    #elseif canImport(AppKit)
    @MainActor
    public static let appIcon: NSImage = NSApp.applicationIconImage!
    #elseif canImport(WatchKit)
    #endif
}


#if canImport(UIKit)
extension UIApplication {
    static var isDarkMode: Bool {
        return UIScreen.main.traitCollection.userInterfaceStyle == .dark
    }
}
#elseif canImport(AppKit)
@available(macOS 10.14, *)
extension NSAppearance {
    var isDarkMode: Bool {
        return bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
    }
}
#elseif canImport(WatchKit)
#endif
