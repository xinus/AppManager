//
//  Storage.swift
//  AppManager
//
//  Created by Xinus on 07/09/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Storage: ComponentType, Sharable {
    public static let shared = Storage()
    
    public let documentPath: URL
    public let libraryPath: URL
    public let cachesPath: URL
    public let tempPath: URL
    public let homePath: URL
    
    private init() {
        let libraryDirectory = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let cachesDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let homeDirectory = NSHomeDirectory()
        let tempDirectory = NSTemporaryDirectory()
        
        documentPath = URL(fileURLWithPath: documentDirectory.last!, isDirectory: true)
        libraryPath = URL(fileURLWithPath: libraryDirectory.last!, isDirectory: true)
        cachesPath = URL(fileURLWithPath: cachesDirectory.last!, isDirectory: true)
        tempPath = URL(fileURLWithPath: homeDirectory, isDirectory: true)
        homePath = URL(fileURLWithPath: tempDirectory, isDirectory: true)
    }
    
    func write<T: Encodable>(_ data: T) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(data)
    }
}

public extension AppManager {
    var storage: Storage {
        return Storage.shared
    }
}

