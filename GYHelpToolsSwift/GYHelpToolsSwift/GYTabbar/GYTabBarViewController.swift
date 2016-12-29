//
//  GYTabBarViewController.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/12/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/12/29  14:35
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class GYTabBarViewController: UITabBarController {
    
    //MARK: - Attributes

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControlers = ["OneViewController",
                              "TwoViewController",
                              "ThreeViewController",
                              "FourViewController"]
        
        for vcName in viewControlers {
            
            //1.动态获取命名空间
            let ns = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
            
            let cls:AnyClass? = NSClassFromString(ns + "." + vcName)
            
            //通过类创建对象
            let vcCls = cls as! UIViewController.Type
            
            let vc = vcCls.init()
            
            vc.tabBarItem.image = UIImage(named: vcName)
            //去掉系统渲染
            //.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            vc.tabBarItem.selectedImage = UIImage(named: vcName + "_highlight")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            vc.title = vcName
            vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orange], for: UIControlState.selected)
            let nav = GYNavViewController()
            nav.addChildViewController(vc)
            addChildViewController(nav)
            
            
        }
        
        

    }
    
    //MARK: - Override
    
    
    //MARK: - Initial Methods
    
    
    //MARK: - Delegate
    
    
    //MARK: - Target Methods
    
    
    //MARK: - Notification Methods
    
    
    //MARK: - KVO Methods
    
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    
    //MARK: - Privater Methods
    
    
    //MARK: - Setter Getter Methods
    
    
    //MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    deinit {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
