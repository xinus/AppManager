//
//  Toast.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public class Toast: ComponentType, Sharable {
    public static let shared = Toast()
    
    private init() {
        
    }
}

public extension AppManager {
    var toast: Toast {
        return Toast.shared
    }
}
