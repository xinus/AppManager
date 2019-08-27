//
//  Router.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Router: ComponentType, Sharable {
    public static let shared = Router()
    
    private init() {
        
    }
}

public extension AppManager {
    var router: Router {
        return Router.shared
    }
}
