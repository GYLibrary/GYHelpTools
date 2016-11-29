//
//  UIColor+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  11:32
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

public extension UIColor {
    
    // UIColor(hexString: 0x50E3C2, alpha: 1.0)
    public convenience init(_ hexString: UInt32, alpha: CGFloat = 1.0) {
        let red     = CGFloat((hexString & 0xFF0000) >> 16) / 255.0
        let green   = CGFloat((hexString & 0x00FF00) >> 8 ) / 255.0
        let blue    = CGFloat((hexString & 0x0000FF)      ) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    
    /// 返回颜色 (无需/255.0)
    ///
    /// - parameter r: r description
    /// - parameter g: g description
    /// - parameter b: b description
    /// - parameter a: a description
    ///
    /// - returns: 颜色
    public convenience init(_ r:CGFloat,g:CGFloat,b:CGFloat,a: CGFloat) {
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        
    }
    
    
    
}
