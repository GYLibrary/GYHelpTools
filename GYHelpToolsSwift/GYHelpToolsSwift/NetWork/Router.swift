//
//  Router.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/14.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/14  17:22
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import  Alamofire


/// URL 以及参数封装
///
/// - login: 登录
/// - register: 注册
enum Router: URLRequestConvertible {
    
    
    public func asURLRequest() throws -> URLRequest {
        return self.urlRequest
    }

    static var token:String?
    
    case login(parameters:[String: AnyObject])
    case register(parameters:[String: AnyObject])
    
    
    /// 请求方式
    var method: Alamofire.HTTPMethod {
        
        switch self {
            
        case .login:
            return .post
        case .register:
            return .post

        }
        
    }
    
    
    /// 路径
    var path: String {
        
        switch self {
        case .login:
            return ServiceApi.login()
        case .register:
            return ServiceApi.register()
        }
        
    }
    
    var urlRequest: URLRequest {
        
        let url = URL(string: path)!
        
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        
        /// 根据需求设置
        if let token = Router.token {
            mutableURLRequest.setValue("\(token)", forHTTPHeaderField: "token")
        }
        
        mutableURLRequest.setValue("com.ozner", forHTTPHeaderField: "clientid")
        mutableURLRequest.setValue("1.0", forHTTPHeaderField: "appversion")
        
        switch self {
            
        case .login(let parm),.register(let parm):
            do {
                return try Alamofire.JSONEncoding().encode(mutableURLRequest, with: parm)
            } catch  {
                
            }
//        case .register(let parm):
//            do {
//              return  try Alamofire.JSONEncoding().encode(mutableURLRequest, with: parm)
//            } catch  {
//                
//            }
//        default:
//            return mutableURLRequest
        }
        
        return mutableURLRequest
        
    }
    
}
