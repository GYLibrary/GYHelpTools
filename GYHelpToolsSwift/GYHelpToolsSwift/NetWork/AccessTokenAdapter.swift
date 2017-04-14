//
//  AccessTokenAdapter.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/14.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/14  13:36
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import Alamofire


/// 添加请求头
class AccessTokenAdapter: RequestAdapter {

    private let accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        var urlRequest = urlRequest
        
        //判断是否包含头根地址 添加一个Authorization的请求头 可防止抓包
        if (urlRequest.url?.absoluteString.hasPrefix("www.baidu.com"))! {
            
            urlRequest.setValue(accessToken, forHTTPHeaderField: "Authorization")
        }
        return urlRequest
    }
    
}
