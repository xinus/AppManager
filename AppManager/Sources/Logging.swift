//
//  Logging.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public struct Logging: ComponentType, Sharable {
    public static let shared = Logging()
}

public extension AppManager {
    var log: Logging {
        return Logging.shared
    }
}
