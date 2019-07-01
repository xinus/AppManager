//
//  Alert.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public struct Alert: ComponentType, Sharable {
    public static let shared = Alert()
}

public extension AppManager {
    var alert: Alert {
        return Alert.shared
    }
}
