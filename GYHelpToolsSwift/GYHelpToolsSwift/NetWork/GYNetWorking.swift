//
//  GYNetWorking.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/12.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/12  16:53
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import Alamofire

enum GYNetWorkStatus {
    
    /// 未知网络
    case UnKnown
    
    /// 无网络
    case NotReachable
    
    /// 手机网络
    case ReachableViaWWAN
    
    /// WIFI
    case ReachableViaWiFi
}

enum GYRequestSerializer {
    
    /// Json格式
    case Json
    
    /// 二进制格式
    case Http
}

typealias GYHttpRequestSuccess = (AnyObject) -> Void

typealias GYHttpRequestFailed = (Error) -> Void?

typealias GYNetWorkState = (GYNetWorkStatus) -> Void

class GYNetWorking{
    
    static let `default`: GYNetWorking = GYNetWorking()
    
    
    /// 网络监听
    let manager = NetworkReachabilityManager(host: "www.baidu.com")

    
    var isRequest: Bool = true
    
    func GET(_ pathKey: String,paramas: NSDictionary?,sucess:((AnyObject) -> Void)?,failure:((NSError) -> Void)?) {
        
        guard !isRequest else {
            return
        }
        
        request("www.baidu.com", method: .get, parameters: paramas as! Parameters?, encoding: JSONEncoding.default, headers: nil).responseJSON { (data) in
            switch data.result {
            case .success(let value):
                
                sucess?(value as AnyObject)
                self.isRequest = true
            case .failure(let error):
                failure?(error as NSError)
                self.isRequest = false
            }
        }
        
    }
    
    
}

extension GYNetWorking {
    
    /// 获取当前网络状态
     func netWorkStatusWithBlock(_ block: @escaping GYNetWorkState) {
    
        manager?.startListening()

        manager?.listener = { status in

            switch status {
            case .unknown:
                block(.UnKnown)
            case .notReachable:
                block(.NotReachable)
            case .reachable(.ethernetOrWiFi):
                block(.ReachableViaWiFi)
            case .reachable(.wwan):
                block(.ReachableViaWWAN)
            }
        }
        
        
    }
    
}
