//
//  Sharable.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

protocol Sharable {
    associatedtype Component
    
    static var shared : Component { get }
}
