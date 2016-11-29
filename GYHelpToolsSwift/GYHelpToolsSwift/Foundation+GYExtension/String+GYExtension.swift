//
//  String+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  13:25
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

// MARK: - String

public extension String {
    
    /// trim the \n and blank of leading and trailing
    ///
    /// - returns: Stirng
    func gy_trim() -> String {
        
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).trimmingCharacters(in: CharacterSet.whitespaces).trimmingCharacters(in: CharacterSet.whitespaces)
        
    }
    
    /// Description
    ///
    /// - returns:  String value of String
    func gy_stringValue() -> String? {
        let scanner = Scanner(string: self)
        var s: NSString? = ""
        if scanner.scanString(self, into: &s) {
            let stringValue = s as? String
            return stringValue
        }
        return nil
    }
    
    /// 将字符串转化为Data
    ///
    /// - returns: Data
    func gy_Data() ->Data {
        return self.data(using: String.Encoding.utf8)!
    }
    
    /// 将字符串转化为Date
    ///
    /// - returns: Date
    func gy_Date() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        return dateFormatter.date(from: self)!
    }
    
    
    
    
}
