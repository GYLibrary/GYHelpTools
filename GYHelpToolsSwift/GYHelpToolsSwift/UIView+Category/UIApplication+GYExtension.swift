//
//  UIApplication+GYExtension.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/11/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/11/29  10:38
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

// MARK: - UIApplication

public extension UIApplication {
    
    // gy_appDelegate: current AppDelegate
    func gy_appDelegate() -> UIApplicationDelegate {
        return UIApplication.shared.delegate!
    }
    
    // gy_currentViewController: current UIViewController
    func gy_currentViewController() -> UIViewController {
        let window = self.gy_appDelegate().window
        var viewController = window!!.rootViewController
        
        while ((viewController?.presentedViewController) != nil) {
            viewController = viewController?.presentedViewController
            
            if ((viewController?.isKind(of:(UINavigationController.classForCoder()))) == true) {
                viewController = (viewController as! UINavigationController).visibleViewController
            } else if ((viewController?.isKind(of:(UITabBarController.classForCoder()))) == true) {
                viewController = (viewController as! UITabBarController).selectedViewController
            }
        }
        
        return viewController!;
    }
    
}


// MARK: - App Version Related

public extension UIApplication {
    
    // gy_appVersion: current App Version
    func gy_appVersion() -> String {
        let infoDict = Bundle.main.infoDictionary! as Dictionary<String, AnyObject>
        return infoDict["CFBundleShortVersionString"] as! String
    }
    /*
    /**
     current App Version released in AppStore
     
     - parameter appId: appId in AppStore
     
     - returns: lastest appVersion in AppStore
     */
    func gy_appVersionInAppStore(appId: String) -> String {
        var appVersion = ""
        
        let url = "https://itunes.apple.com/lookup?id=\(appId)"
        let request = NSURLRequest(url: NSURL(string: url)! as URL)
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest)
        { (data, response, error) in
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                if let results = jsonData["results"]! {
                    assert(results.count != 0, "results should not be null")
                    
                    appVersion = results.firstObject!?["version"]! as! String
                }
                
                semaphore.signal()
                
            } catch {
                
            }
        }
        dataTask.resume()
        
        semaphore.wait(timeout: DISPATCH_TIME_FOREVER)
        
        return appVersion
    }
    
    /**
     Check whether this version of running App released or not.
     For example:
     Version of running App is 1.3, and app version in AppStore is 1.2,
     then, this method will return false.
     Several days later, app version in AppStore promotes to be 1.3 or 1.4,
     then this method will return true.
     
     - parameter appId: appId in AppStore
     
     - returns: true or false
     */
    func gy_isRunningAppVersionReleased(appId: String) -> Bool {
        let appVersionInAppStore = self.gy_appVersionInAppStore(appId: appId)
        
        if self.gy_appVersion().compare(appVersionInAppStore) != .orderedDescending {
            return true
        }
        
        return false
    }
    */
}


// MARK: - snapShot

public extension UIApplication {
    
    func gy_snapShot(inView: UIView) -> UIImage {
        
        UIGraphicsBeginImageContext(inView.bounds.size)
        inView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let snapShot: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return snapShot
    }
    
}
