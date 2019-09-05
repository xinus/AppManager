//
//  KeyedDecodingContainerExtensions.swift
//  AppManager
//
//  Created by Xinus on 09/04/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    
    //MARK: - Int
    func decodeIfPresent(_ type: Int.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Int? {
        if let result = try intDecodeIfPresent(forKey: key) {
            return Int(exactly: result)
        }
        
        return nil
    }
    
    func intDecodeIfPresent(forKey key: K) throws -> Int? {
        do {
            let value = try decode(Int.self, forKey: key)
            return value
        }catch {
            let err = error as! DecodingError
            switch err {
            case .typeMismatch(_, _):
                if let value = try? decode(String.self, forKey: key) {
                    return Int(value)
                }
                if let value = try? decode(Double.self, forKey: key) {
                    return Int(value)
                }
                if let value = try? decode(Float.self, forKey: key) {
                    return Int(value)
                }
                if let value = try? decode(Bool.self, forKey: key) {
                    return value ? 1 : 0
                }
            default:break
            }
        }
        return nil
    }
    
    //MARK: - String
    func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String? {
        do {
            let value = try decode(type, forKey: key)
            return value
        }catch {
            let err = error as! DecodingError
            switch err {
            case .typeMismatch(_, _):
                if let value = try? decode(Int.self, forKey: key) {
                    return String(value)
                }
                if let value = try? decode(Double.self, forKey: key) {
                    return String(value)
                }
                if let value = try? decode(Float.self, forKey: key) {
                    return String(value)
                }
                if let value = try? decode(Bool.self, forKey: key) {
                    return String(value)
                }
            default: break
            }
        }
        return nil
    }
    
    //MARK: - Other types
    func decodeIfPresent<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T? where T : Decodable {
        do {
            let value = try decode(type, forKey: key)
            return value
        }catch {
            let err = error as! DecodingError
            switch err {
            case .typeMismatch(_, _):
                return nil
            default: break
            }
        }
        return nil
    }
    
}
