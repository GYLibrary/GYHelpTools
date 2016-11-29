//
//  UIDevice+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by zhuguangyang on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Github:https://github.com/airfight
//  简书:http://www.jianshu.com/users/17d6a01e3361

import UIKit

// MARK: - UIDevice
public extension UIDevice{
    
    // Screen Related
    func gy_screenSize() -> CGSize {
        return (UIScreen.main.currentMode?.size)!
    }
    
    func gy_isIPhone4s() -> Bool {
        return self.gy_screenSize() == CGSize(width: 640, height: 960)
    }
    
    func gy_isIPhone5() -> Bool {
        return self.gy_screenSize() == CGSize(width: 640, height: 1136)
    }
    
    func gy_isIPhone6() -> Bool {
        return self.gy_screenSize() == CGSize(width: 750, height: 1334)
    }
    
    func gy_isIPhone6Plus() -> Bool {
        return self.gy_screenSize() == CGSize(width: 1080, height: 1920)
    }
    
    func gy_isIPhone6PlusBigMode() -> Bool {
        return self.gy_screenSize() == CGSize(width: 1242, height: 2280)
    }
    
//    func gy_isIPadAir2() -> Bool {
//        return self.gy_screenSize() == CGSize(1536, 2048)
//    }
//    
//    func gy_isIPadPro() -> Bool {
//        return self.gy_screenSize() == CGSize(2048, 2732)
//    }
    
}

// MARK: - Language Related

public extension UIDevice {
    
    func gy_currentLanguage() -> String {
        return NSLocale.preferredLanguages.first!
    }
    
    func gy_isCurrentLanguage_en() -> Bool {
        let prefix = "en"
        return self.gy_currentLanguage().hasPrefix(prefix)
    }
    
    func gy_isCurrentLanguage_zh_Hans() -> Bool {
        let prefix = "zh-Hans"
        return self.gy_currentLanguage().hasPrefix(prefix)
    }
    
    func gy_isCurrentLanguage_zh_Hant() -> Bool {
        let prefix = "zh-Hant"
        return self.gy_currentLanguage().hasPrefix(prefix)
    }
    
    func gy_isCurrentLanguage_ja() -> Bool {
        let prefix = "ja"
        return self.gy_currentLanguage().hasPrefix(prefix)
    }
    
    func gy_isCurrentLanguage_ko() -> Bool {
        let prefix = "ko"
        return self.gy_currentLanguage().hasPrefix(prefix)
    }
    
}
