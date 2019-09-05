//
//  Router.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public protocol RouterInitable {
    init?(router url: URL, context: Any?)
}

public class Router: ComponentType, Sharable {
    public static let shared = Router()
    
    private init() {
        
    }
    
    public func register<T: RouterInitable>(_ url: URL, handler: T) {
        
    }
}

public enum RouterError : Error {
    case unknown(url: URL)
    case duplicated(url: URL)
}


/// System url support.
extension Router {
    public func openAppSetting() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.openURL(url)
        }
    }
    
    func openURL(_ url: URL) -> Bool {
        let ret = UIApplication.shared.openURL(url)
        appMgr.logger.trace("openURL:'\(url)' [\(ret ? "OK.":"FAILED.")]")
        return ret
    }
}

public extension AppManager {
    var router: Router {
        return Router.shared
    }
}
