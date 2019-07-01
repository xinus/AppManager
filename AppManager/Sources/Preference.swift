//
//  Preference.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public struct Preference: ComponentType, Sharable {
    public static let shared = Preference()
}

public extension AppManager {
    var preference: Preference {
        return Preference.shared
    }
}
