//
//  Profile.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Profile: ComponentType, Sharable {
    public static let shared = Profile()
    
    private init() {
        
    }
}

public extension AppManager {
    var profile: Profile {
        return Profile.shared
    }
}
