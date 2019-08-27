//
//  Keychain.swift
//  AppManager
//
//  Created by Xinus on 07/08/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import KeychainSwift

public class Keychain: ComponentType, Sharable {
    public static let shared = Keychain()
    
    private let keychain = KeychainSwift(keyPrefix: "")
    
    private init() {
    }
}

public extension AppManager {
    var keychain: Keychain {
        return Keychain.shared
    }
}

extension Keychain {

    public func set(_ value: String, for key: String) {
        self.keychain.set(value, forKey: key)
    }
    
    public func set(_ value: Bool, for key: String) {
        self.keychain.set(value, forKey: key)
    }
    
    public func set(_ value: Data, for key: String) {
        self.keychain.set(value, forKey: key)
    }
    
    public func get(_ key: String) -> String? {
        return self.keychain.get(key)
    }
    
    public func getData(_ key: String) -> Data? {
        return self.keychain.getData(key)
    }
    
    public func getBool(_ key: String) -> Bool? {
        return self.keychain.getBool(key)
    }
}
