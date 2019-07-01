//
//  Info.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public struct Info: ComponentType, Sharable {
    public static let shared = Info()
    
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
    
}

public extension AppManager {
    var info: Info {
        return Info.shared
    }
}
