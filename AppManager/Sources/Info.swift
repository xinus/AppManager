//
//  Info.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Info: ComponentType, Sharable {
    public static let shared = Info()
    
    private init() {
        
    }

    public var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    public var appDisplayName: String? {
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
    }
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    public var deviceModel: String {
        return UIDevice.current.model
    }
    
    public var deviceName: String {
        return UIDevice.current.name
    }
    
    public var deviceBatteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    
    public var deviceOrientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    public var osVersion: String {
        return UIDevice.current.systemVersion
    }
    
    public var osName: String {
        return UIDevice.current.systemName
    }
}

public extension AppManager {
    var info: Info {
        return Info.shared
    }
}
