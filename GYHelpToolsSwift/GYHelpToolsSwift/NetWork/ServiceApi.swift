//
//  ServiceApi.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/14.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/14  17:20
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit


/// APIDemo
class ServiceApi: NSObject {
    
    #if DEBUG
    static var host: String = "http://wechat.hoyofuwu.com"
    #else
    static var host: String = "http://www.baidu.com"
    #endif
    
    /// 登录
    ///
    /// - Returns: return value description
    internal class func login() -> String {
        return "\(host)/FamilyAccount/AppLogin"
    }
    
    /// 注册
    ///
    /// - Returns: return value description
    internal class func register() -> String {
        return "\(host)/api/register"
    }
    
    internal class func test() -> String {
        return "https://api.github.com/repos/ozner-app-ios-org/updateApi/contents/InesUpdateFile/inse.json"
    }
}
