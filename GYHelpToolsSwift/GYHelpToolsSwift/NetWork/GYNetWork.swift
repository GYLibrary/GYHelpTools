//
//  GYNetWork.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/18.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/18  09:05
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import Alamofire

typealias AlamofireRequest = Alamofire.Request
//typealias AlamofireManager = Alamofire.SessionManager


/// 网络请求方式
public enum RequestMethod {
    case get,post,delete
    
    var method: Alamofire.HTTPMethod {
        
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .delete:
            return .delete
     
        }
        
    }
}

/// ParameterEncoding
///
/// - url: url description
/// - json: json description
/// - propertyList: propertyList description
public enum RequestParameterEncoding {
    
    case url,json,propertyList(PropertyListSerialization.PropertyListFormat, PropertyListSerialization.WriteOptions)
    
    var encode: ParameterEncoding {
        
        switch self {
        case .url:
            return URLEncoding.default
        case .json:
            return JSONEncoding.default
        case .propertyList(let format, let options):
            return PropertyListEncoding(format: format, options: options)
        }
        
    }
}

public enum TaskType {
    
    case data,download
    
}

public enum ResponseSerializer {
    case data,string,json,propertyList
}


/// ignored the RequestProtocol
public protocol RequestCustom {
    
    var customURLRequest: URLRequest { get }
    
}


/// cache Protocol
public protocol RequestCacheProtocol: class {
    
    var cacheSeconds: Int { get }
    var cacheVersion: UInt64 { get }
}

public extension RequestCacheProtocol {
    
    /// default value 0
    var cacheVersion: UInt64 { return 0 }
    
}

public protocol RequestProtocol : class {
    
    var requestURL: String { get }
    
    var taskType: TaskType { get }
    var baseURL: String { get }
    var method:RequestMethod { get }
    var parameters: [String: Any]? { get }
    
    var headers: [String:String]? { get }
    var paramterEncoding: RequestParameterEncoding { get }
    var responseStringEncoding: String.Encoding { get }
    var responseJSONReadingOption: JSONSerialization.ReadingOptions { get }
    var responseSerializer: ResponseSerializer { get }
 
    
}

/**
 make RequestProtocol some methed default and optional
 */
public extension RequestProtocol {
    var baseURL: String { return "www.baidu.com" }
    
    var parameters: [String: Any]? { return nil }
    var headers: [String: String]? { return nil }
    var parameterEncoding: RequestParameterEncoding { return  .json }
    var responseStringEncoding: String.Encoding { return String.Encoding.utf8 }
    var responseJSONReadingOption: JSONSerialization.ReadingOptions { return .allowFragments }
    var responseSerializer: ResponseSerializer { return .json }
}


class GYNetWork: NSObject {

}
  
