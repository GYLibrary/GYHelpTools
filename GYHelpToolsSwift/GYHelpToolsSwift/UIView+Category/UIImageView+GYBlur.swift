//
//  UIImageView+GYBlur.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  11:31
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

public extension UIImageView {
    
    // initializer严格分为Designated Initializer和Convenience Initializer并且有语法定义。
    // 而在Objective-C中没有明确语法标记哪个初始化方式是convenience方法。
    // Swift中的convenience初始化方法, 只作为补充和提供使用上的方便.
    // 所有的convenience方法都必须调用同一个类中的designated方法进行设置, 且不能被子类重写或从子类中以super的方式调用.
    // UIImageView(frame: self.view.frame, blurEffectStyle: .Light)
    
    /// 模糊背景
    ///
    /// - parameter frame:           frame description
    /// - parameter blurEffectStyle: blurEffectStyle description
    ///
    /// - returns: return value description
    public convenience init(frame: CGRect, blurEffectStyle: UIBlurEffectStyle) {
        self.init(frame: frame)
        
        let blurView = UIVisualEffectView(frame: self.bounds)
        self.addSubview(blurView)
        
        blurView.effect = UIBlurEffect(style: blurEffectStyle)
    }
    
    
}
