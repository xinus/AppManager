//
//  ServiceManager.swift
//  AppManager
//
//  Created by Xinus on 07/09/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public class ServiceManager: ComponentType, Sharable {
    public static let shared = ServiceManager()
    
    private init() {
        
    }
}

public extension AppManager {
    var serviceMgr: ServiceManager {
        return ServiceManager.shared
    }
}

