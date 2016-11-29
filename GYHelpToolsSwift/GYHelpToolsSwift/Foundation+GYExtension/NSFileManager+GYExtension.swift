//
//  NSFileManager+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  13:19
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

public extension FileManager {
    
    func gy_homeDirectory() -> String {
        
        return NSHomeDirectory()
    }
    
    func gy_tempDirectory() -> String {
        
        return NSTemporaryDirectory()
    }
    
    func gy_documentsDirectory() -> String {
        
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    func gy_libraryDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    func gy_cacheDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
    
}


