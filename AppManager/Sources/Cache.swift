//
//  Cache.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public struct Cache: ComponentType, Sharable {
    public static let shared = Cache()
}

public extension AppManager {
    var cache: Cache {
        return Cache.shared
    }
}
