//
//  Device.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public struct Device: ComponentType, Sharable {
    public static let shared = Device()
    
    public var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
}

public extension AppManager {
    var device: Device {
        return Device.shared
    }
}
