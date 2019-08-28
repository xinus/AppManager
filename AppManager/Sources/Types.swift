//
//  Types.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public protocol ComponentType {
    
}

public protocol AppObserverType {
    func applicationDidFinishLaunchingWithOptions(launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    func applicationWillResignActive()
    func applicationDidEnterBackground()
    func applicationWillEnterForeground()
    func applicationDidBecomeActive()
    func applicationWillTerminate()
}

public protocol ServiceType: ComponentType, AppObserverType {
    
}

extension ServiceType {
    func applicationDidFinishLaunchingWithOptions(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
    func applicationWillResignActive() {}
    func applicationDidEnterBackground() {}
    func applicationWillEnterForeground() {}
    func applicationDidBecomeActive() {}
    func applicationWillTerminate() {}
}

public protocol Sharable {
    associatedtype Component
    
    static var shared : Component { get }
}
