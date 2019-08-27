//
//  Network.swift
//  AppManager
//
//  Created by Xinus on 8/26/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import Moya
import Result

public typealias ApiResponse = Response
public typealias ApiError = MoyaError
public typealias ApiResult = Result<ApiResponse, ApiError>

open class ApiRequest {
    public enum ContentType {
        case form
        case json
    }
    
    public var parameters: [String: Any] = [:]
    public var contentType: ContentType = .form
    
    private let _baseURL: URL
    private let _path: String
    
    public init?(url: URL) {
        
        guard let baseUrl = url.baseURL else {
            return nil
        }
        
        _baseURL = baseUrl
        _path = url.path
    }
    
    public convenience init?(urlString: String) {
        guard let url = URL(string: urlString) else {
            return nil
        }
        self.init(url: url)
    }
}

extension ApiRequest : TargetType {
    public var baseURL: URL {
        return _baseURL
    }
    
    public var path: String {
        return _path
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    public var task: Task {
        switch contentType {
        case .json:
            return .requestJSONEncodable(self.parameters as! Encodable)
        default:
            return .requestParameters(parameters: self.parameters, encoding: URLEncoding.httpBody)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}

extension ApiRequest : Hashable {
    public static func == (lhs: ApiRequest, rhs: ApiRequest) -> Bool {
        return lhs === rhs
    }
    
    public var hashValue: Int {
        return baseURL.hashValue ^ path.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}

public class Network: ComponentType, Sharable {
    public static let shared = Network()
    
    public let apiProvider = MoyaProvider<MultiTarget>()
    
    let requestPool: Set<ApiRequest> = []
    
    public func asyncSend(_ request: ApiRequest, handler: @escaping (ApiResult)->Void) {

        apiProvider.request(.target(request)) { (result) in
            handler(result)
        }
    }
    
    public func asyncSend(_ urlString: String, parameters: Dictionary<String, Any>, handler: @escaping (ApiResult)->Void) {
        
        guard let request = ApiRequest(urlString: urlString) else {
            let result: ApiResult = .init(error: .requestMapping(urlString))
            handler(result)
            return
        }

        request.parameters = parameters
        self.asyncSend(request, handler: handler)
    }
}

public extension AppManager {
    var net: Network {
        return Network.shared
    }
}
