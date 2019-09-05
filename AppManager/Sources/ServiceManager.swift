//
//  ServiceManager.swift
//  AppManager
//
//  Created by Xinus on 07/09/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class ServiceManager: ComponentType, Sharable {
    public static let shared = ServiceManager()
    
    var services: [ServiceType] = []
    
    private init() {
        self.register(AppMonitorService())
    }
    
    public func register(_ service: ServiceType) {
        appMgr.logger.info("Register: \(service.name), ver: \(service.version)")
        services.append(service)
    }
}

extension ServiceManager: AppObserverType {
    public func applicationDidFinishLaunchingWithOptions(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        services.forEach { (service) in
            service.applicationDidFinishLaunchingWithOptions(launchOptions: launchOptions)
        }
    }
    
    public func applicationWillResignActive() {
        services.forEach { (service) in
            service.applicationWillResignActive()
        }
    }
    
    public func applicationDidEnterBackground() {
        services.forEach { (service) in
            service.applicationDidEnterBackground()
        }
    }
    
    public func applicationWillEnterForeground() {
        services.forEach { (service) in
            service.applicationWillEnterForeground()
        }
    }
    
    public func applicationDidBecomeActive() {
        services.forEach { (service) in
            service.applicationDidBecomeActive()
        }
    }
    
    public func applicationWillTerminate() {
        services.forEach { (service) in
            service.applicationWillTerminate()
        }
    }
}

public extension AppManager {
    var serviceMgr: ServiceManager {
        return ServiceManager.shared
    }
}

