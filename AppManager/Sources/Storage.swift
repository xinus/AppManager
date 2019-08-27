//
//  Storage.swift
//  AppManager
//
//  Created by Xinus on 07/09/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public class Storage: ComponentType, Sharable {
    public static let shared = Storage()
    
    private init() {
        
    }
}

public extension AppManager {
    var storage: Storage {
        return Storage.shared
    }
}

