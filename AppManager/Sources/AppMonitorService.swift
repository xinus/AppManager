//
//  AppMonitorService.swift
//  AppManager
//
//  Created by Xinus on 09/06/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

final class AppMonitorService: ServiceType {
    var name = "AppMonitorService"
    var version = "0.1.0"
    
    init() {
        appMgr.logger.info("--------------------------------------------------")
        appMgr.logger.info("Launch Time: \(Date())")
        appMgr.logger.info("OS: \(appMgr.info.osName) \(appMgr.info.osVersion)")
        appMgr.logger.info("App Name: \(appMgr.info.appDisplayName ?? "")")
        appMgr.logger.info("App Bundle: \(appMgr.info.appBundleID ?? "")")
        appMgr.logger.info("App Version: \(appMgr.info.appVersion ?? "")")
        appMgr.logger.info("App Build: \(appMgr.info.appBuild ?? "")")
        appMgr.logger.info("--------------------------------------------------")
    }
    
    func applicationDidFinishLaunchingWithOptions(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        appMgr.logger.info("applicationDidFinishLaunchingWithOptions: \(launchOptions ?? [:])")
    }
    
    func applicationWillResignActive() {
        appMgr.logger.info("applicationWillResignActive")
    }
    
    func applicationDidEnterBackground() {
        appMgr.logger.info("applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground() {
        appMgr.logger.info("applicationWillEnterForeground")
    }
    
    func applicationDidBecomeActive() {
        appMgr.logger.info("applicationDidBecomeActive")
    }
    
    func applicationWillTerminate() {
        appMgr.logger.info("applicationWillTerminate")
    }
}
