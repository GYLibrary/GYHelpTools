//
//  GYErrorCode.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/18.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/18  14:12
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

enum GYErrorCode: Int {
    
    case 用户名或密码错误 = 404
    
    var errorString:String {
        switch self.rawValue {
        case 404:
            return "用户名或密码错误"
        default:
            break
        }
        return "未知错误"
    }
}
