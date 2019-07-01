//
//  Profile.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public struct Profile: ComponentType, Sharable {
    public static let shared = Profile()
}

public extension AppManager {
    var profile: Profile {
        return Profile.shared
    }
}
