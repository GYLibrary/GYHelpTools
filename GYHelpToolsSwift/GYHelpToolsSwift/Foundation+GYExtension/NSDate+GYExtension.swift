//
//  NSDate+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  13:11
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

//MARK: - Date

public extension Date {
    
    
    /// 返回日期字符串
    ///
    /// - parameter dateFormat: 日期格式化 默认格式:"yyyy-MM-dd hh:mm:ss"
    ///
    /// - returns: 日期字符串
    func gy_stringFromDate(dateFormat: String?) ->String {
        
        let dateFormatter = DateFormatter()
        
        if dateFormat != nil {
            
            dateFormatter.dateFormat = dateFormat
            
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        }
        
        return dateFormatter.string(from: self)
        
    }
    
}

