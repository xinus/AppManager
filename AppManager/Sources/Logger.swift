//
//  Logger.swift
//  AppManager
//
//  Created by Xinus on 07/01/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

public class Logger: ComponentType, Sharable {
    public static let shared = Logger()
    public var level: Level = .info
    
    private init() {
        
    }
    
    public enum Level : CaseIterable {
        case trace
        case debug
        case info
        case warning
        case error
        case critical
    }

    public struct Message: ExpressibleByStringLiteral, Equatable, CustomStringConvertible, ExpressibleByStringInterpolation {
        
        public typealias StringLiteralType = String
        private var value: String
        
        public init(stringLiteral value: String) {
            self.value = value
        }
        
        public var description: String {
            return self.value
        }
    }
}

extension Logger.Level {
    internal var intValue: Int {
        switch self {
        case .trace:
            return 0
        case .debug:
            return 1
        case .info:
            return 2
        case .warning:
            return 3
        case .error:
            return 4
        case .critical:
            return 5
        }
    }
    
    internal var mark: String  {
        switch self {
        case .trace:
            return "T"
        case .debug:
            return "D"
        case .info:
            return "I"
        case .warning:
            return "W"
        case .error:
            return "E"
        case .critical:
            return "C"
        }
    }
}

extension Logger.Level: Comparable {
    public static func < (lhs: Logger.Level, rhs: Logger.Level) -> Bool {
        return lhs.intValue < rhs.intValue
    }
}

extension Logger {
    public func trace(_ message: @autoclosure () -> Logger.Message = "",
               file: String = #file, function: String = #function, line: UInt = #line) {
        
        self.log(.trace, message: message(), file: file, function: function, line: line)
    }
    
    public func debug(_ message: @autoclosure () -> Logger.Message = "",
                     file: String = #file, function: String = #function, line: UInt = #line) {
        
        self.log(.debug, message: message(), file: file, function: function, line: line)
    }
    
    public func info(_ message: @autoclosure () -> Logger.Message = "",
                     file: String = #file, function: String = #function, line: UInt = #line) {
        
        self.log(.info, message: message(), file: file, function: function, line: line)
    }
    
    public func warning(_ message: @autoclosure () -> Logger.Message = "",
                     file: String = #file, function: String = #function, line: UInt = #line) {
        
        self.log(.warning, message: message(), file: file, function: function, line: line)
    }
    
    public func error(_ message: @autoclosure () -> Logger.Message = "",
                     file: String = #file, function: String = #function, line: UInt = #line) {
        
        self.log(.error, message: message(), file: file, function: function, line: line)
    }
    
    public func critical(_ message: @autoclosure () -> Logger.Message = "",
                     file: String = #file, function: String = #function, line: UInt = #line) {
        
        self.log(.critical, message: message(), file: file, function: function, line: line)
    }

    func log(_ level: Level, message: @autoclosure () -> Logger.Message,
              file: String = #file, function: String = #function, line: UInt = #line) {
        
        guard level >= self.level else {
            return
        }
        
        let thread = Thread.current
        
        let now = Date()
        let filePath = URL(fileURLWithPath: file)
        print("[\(level.mark)] \(now) <\(filePath.lastPathComponent)#\(function)#line:\(line)#\(thread.isMainThread ? "Main" : "Worker")> \(message())")
    }
}

public extension AppManager {
    var logger: Logger {
        return Logger.shared
    }
}
