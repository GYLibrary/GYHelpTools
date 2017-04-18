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

public func Print<T>(_ message: T,file: String = #file,method: String = #function, line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

typealias AlamofireManager = Alamofire.SessionManager

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

typealias GYHttpRequestFailed = (Error) -> Void

typealias GYNetWorkState = (GYNetWorkStatus) -> Void

class GYNetWorking{
    
    static let `default`: GYNetWorking = GYNetWorking()
    
    /// 网络监听
    let manager = NetworkReachabilityManager(host: "www.baidu.com")
    
//    var alldataRequestTask:NSMutableArray = NSMutableArray()
    
    
    var isRequest: Bool = true
    
    func GET(_ pathKey: String,paramas: NSDictionary?,sucess:((AnyObject) -> Void)?,failure:((NSError) -> Void)?) {
        
        guard !isRequest else {
            return
        }
        
      Alamofire.request("www.baidu.com", method: .get, parameters: paramas as! Parameters?, encoding: JSONEncoding.default, headers: nil).responseJSON { (data) in
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


// MARK: - 获取当前网络状态
extension GYNetWorking {
    
   
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
    
    fileprivate func isReachable() -> Bool{
        return (manager?.isReachable)!
    }
    
    fileprivate func isWWANetwork() -> Bool {
        return (manager?.isReachableOnWWAN)!
    }
    
    fileprivate func isWiFiNetwork() -> Bool {
        return (manager?.isReachableOnEthernetOrWiFi)!
    }
}


// MARK: - 网络请求
extension GYNetWorking {
    
    /// 自动校验 返回Json格式
    ///
    /// - Parameters:
    ///   - urlRequest: urlRequest description
    ///   - sucess: sucess description
    ///   - failure: failure description
    func requestJson(_ urlRequest: URLRequestConvertible, sucess:@escaping GYHttpRequestSuccess,failure: @escaping GYHttpRequestFailed) {
       let dataRequest =  AlamofireManager.default.request(urlRequest)
                                .validate()
                                .responseJSON { [weak self] (response) in
                                    
                        self?.handleResponse(response, sucess: sucess, failure: failure)
                                    
        }
//        Print(dataRequest)
//        if !alldataRequestTask.contains(dataRequest) {
//            alldataRequestTask.add(dataRequest)
//        } else {
//            dataRequest.cancel()
//        }
//        
//        Print(alldataRequestTask.count)
    }
        
    
    
    func request(_ urlRequest: URLRequestConvertible, sucess:GYHttpRequestSuccess,failure: GYHttpRequestFailed) -> DataRequest {
        
        return SessionManager.default.request(urlRequest)
        
    }
    
    
    
    // MARK: - -----------------
    
    func request(_ post: HTTPMethod) -> DataRequest{
        
        
        Alamofire.request("").response { (response)  in
            
            debugPrint(response)
        }
        
        Alamofire.request("", method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .response { (data) in
                print(data)
        }
        //手动验证
        Alamofire.request("")
                 .validate(statusCode: 200..<300)
                 .validate(contentType: ["application/json"])
                 .responseData { (response) in
                    
                    print(response)
                    
        }
        //自动验证会验证 200...299 之间的状态码并验证响应数据的 Content-Type 是否和请求头的指定的 Accept 类型是否匹配。
        Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
        
        Alamofire.request(Router.login(parameters: [:]))
                 .response { (date) in
                    print(date)
                 }
        
        return SessionManager.default.request("www.baidu.com", method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil)
        
        
    }
    
    
}


// MARK: - 处理请求结果
extension GYNetWorking {
    
    /// 处理请求结果 （根据项目需求修改）
    ///
    /// - Parameters:
    ///   - response: response description
    ///   - sucess: sucess description
    ///   - failure: failure description
    fileprivate func handleResponse(_ response: DataResponse<Any> ,sucess:@escaping GYHttpRequestSuccess,failure: @escaping GYHttpRequestFailed) {
        
       
        switch response.result {
        case .success(let json):
            Print(json)
            var result = json as! [String:AnyObject]
            
            guard let code = result["state"]?.int8Value else {
                return
            }
            
            if code > 0 {
                
                sucess(json as AnyObject)
                
            } else {
                let errorString = GYErrorCode(rawValue: 404)?.errorString ?? "Errcode未解析"
                let userInfo = [NSLocalizedDescriptionKey:errorString]
                let error: NSError = NSError(domain: errorString, code: 123, userInfo: userInfo)
                
                failure(error)
            }
            
        case .failure(let error):
            
            failure(error)
        }

        
    }
    
}

