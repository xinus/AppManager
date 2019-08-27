//
//  Builder.swift
//  AppManager
//
//  Created by Xinus on 2019/7/27.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Builder: ComponentType, Sharable {
    public static let shared = Builder()
    
    private init() {
        
    }
}

public extension AppManager {
    var builder: Builder {
        return Builder.shared
    }
}
