//
//  OAuth2Handler.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2017/4/14.
//  Copyright © 2017年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/14  13:49
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import Alamofire

class OAuth2Handler: RequestAdapter, RequestRetrier {
    /// Inspects and adapts the specified `URLRequest` in some manner if necessary and returns the result.
    ///
    /// - parameter urlRequest: The URL request to adapt.
    ///
    /// - throws: An `Error` if the adaptation encounters an error.
    ///
    /// - returns: The adapted `URLRequest`.
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        return urlRequest
    }

    
    public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        if let response = request.task?.response as? HTTPURLResponse,response.statusCode == 401 {
            
            completion(true, 0.5)
        } else {
            completion(false, 0)
        }
        
    }



}
