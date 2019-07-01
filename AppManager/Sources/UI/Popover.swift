//
//  Popover.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public struct Popover: ComponentType, Sharable {
    public static let shared = Popover()
}

public extension AppManager {
    var popover: Popover {
        return Popover.shared
    }
}
