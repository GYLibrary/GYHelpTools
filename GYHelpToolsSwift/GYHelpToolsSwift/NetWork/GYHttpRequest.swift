//
//  GYHttpRequest.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/12.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/12  14:43
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation
import Alamofire

public protocol Request {
    
    var path:String{get}
    var method: HTTPMethod{get}
    var parameters: [String: Any] {get set}
    
    
}
