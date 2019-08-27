//
//  AppManager.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class AppManager {
    public static let shared = AppManager()
    
    private init() {
        
    }
}

public let appMgr = AppManager.shared


// MARK: -  Comments Example
extension AppManager {
    
    /// Summary Text.
    ///
    /// Discussion Text.
    ///
    /// - Parameters:
    ///   - paramA: The first parameter.
    ///   - paramB: The second parameter.
    ///
    /// - Returns: A int value.
    func exampleFuncA(paramA: Int, paramB: Int) -> Int {
        return .zero
    }
}
