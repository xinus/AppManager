//
//  Cache.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Cache: ComponentType, Sharable {
    public static let shared = Cache()
    
    public var cacheData: [String: Any] = [:]
    
    private init() {

    }
    
    public func set<T>(_ value: T, for key: String) {
        cacheData[key] = value
    }
    
    public func get<T>(for key: String) -> T? {
        return cacheData[key] as? T
    }
    
    public subscript<T>(_ key: String) -> T? {
        return get(for: key)
    }
    
    @discardableResult
    public func delete<T>(_ key: String) -> T?{
        return cacheData.removeValue(forKey: key) as? T
    }
}

extension Cache : CustomStringConvertible {
    public var description: String {
        return cacheData.description
    }
}

public extension AppManager {
    var cache: Cache {
        return Cache.shared
    }
}

