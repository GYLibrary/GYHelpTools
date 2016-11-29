//
//  NSData+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  13:03
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

public extension Data{
    
    
    /// 转化Data为Any
    ///
    /// - returns: json
    func gy_jsonObjectFromNSData() -> Any {
        
        var jsonObject: Any!
        
        do {
            jsonObject = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers)
            
        } catch (let error) {
            print(error)
        }
        
        return jsonObject
    }
    
}
