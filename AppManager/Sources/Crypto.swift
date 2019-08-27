//
//  Crypto.swift
//  AppManager
//
//  Created by Xinus on 07/08/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import CommonCrypto

public class Crypto: ComponentType, Sharable {
    public static let shared = Crypto()
    
    private init() {
        
    }
}

public extension AppManager {
    var crypto: Crypto {
        return Crypto.shared
    }
}
