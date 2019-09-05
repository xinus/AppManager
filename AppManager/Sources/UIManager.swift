//
//  UIManager.swift
//  AppManager
//
//  Created by Xinus on 09/06/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public class UIManager: ComponentType, Sharable {
    public static let shared = UIManager()
    
    private init() {
        
    }
    
    func toast(_ text: String) {
        
    }
    
    func popover(_ text: String) {
        
    }
    
    func alert(_ text: String) {
        
    }
}

public extension AppManager {
    var ui: UIManager {
        return UIManager.shared
    }
}
