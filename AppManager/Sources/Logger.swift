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
    let dispatchQueue: DispatchQueue

    private init() {
        self.dispatchQueue = DispatchQueue(label: "logger")
    }
    
    public enum Level : CaseIterable {
        case trace
        case debug
        case info
        case warning
        case error
        case critical
    }

    public class Message {
        public let level: Level
        public let message: String
        public let file: String
        public let fileName: String
        public let function: String
        public let processName: String
        public let threadId: UInt32
        public let processId: Int32
        public let line: UInt
        public let timestamp: Date
        
        init(level: Level, message: String, file: String, function: String, line: UInt) {
            self.level = level
            self.message = message
            self.file = file
            self.function = function
            self.line = line
        
            self.timestamp = Date()
            self.fileName = URL(fileURLWithPath: file).lastPathComponent
            
            self.processName = ProcessInfo.processInfo.processName
            self.processId = ProcessInfo.processInfo.processIdentifier
            
//            var tid: UInt64 = 0
//            pthread_threadid_np(nil, &tid)
            let mach_port = pthread_mach_thread_np(pthread_self())
            self.threadId = mach_port
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
            return "Trace"
        case .debug:
            return "Debug"
        case .info:
            return "Info"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        case .critical:
            return "Critical"
        }
    }
}

extension Logger.Level: Comparable {
    public static func < (lhs: Logger.Level, rhs: Logger.Level) -> Bool {
        return lhs.intValue < rhs.intValue
    }
}

extension Logger {
    public func trace(_ message: @autoclosure () -> String = "",
               file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        self.log(.trace, message: message(), file: file, function: function, line: line)
    }
    
    public func debug(_ message: @autoclosure () -> String = "",
                     file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        self.log(.debug, message: message(), file: file, function: function, line: line)
    }
    
    public func info(_ message: @autoclosure () -> String = "",
                     file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        self.log(.info, message: message(), file: file, function: function, line: line)
    }
    
    public func warning(_ message: @autoclosure () -> String = "",
                     file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        self.log(.warning, message: message(), file: file, function: function, line: line)
    }
    
    public func error(_ message: @autoclosure () -> String = "",
                     file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        self.log(.error, message: message(), file: file, function: function, line: line)
    }
    
    public func critical(_ message: @autoclosure () -> String = "",
                     file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
        
        self.log(.critical, message: message(), file: file, function: function, line: line)
    }

    func log(_ level: Level, message: @autoclosure () -> String, file: StaticString, function: StaticString, line: UInt) {
        
        guard level >= self.level else {
            return
        }
        
        let msg = Message(level: level, message: message(), file: String(describing: file), function: String(describing: function), line: line)
        self._log(msg)
    }
    
    func _log(_ message: Message) {
        self.dispatchQueue.async {
            let logText = "\(message.timestamp) \(message.processName)[\(message.processId):\(message.threadId)] \(message.fileName)[:\(message.line)] [\(message.level.mark)] \(message.message)"
            print(logText)
        }
    }
}

public extension AppManager {
    var logger: Logger {
        return Logger.shared
    }
}
