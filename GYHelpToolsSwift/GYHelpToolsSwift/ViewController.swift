//
//  ViewController.swift
//  GYHelpToolsSwift
//
//  Created by zhuguangyang on 2016/11/23.
//  Copyright © 2016年 Giant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = "   123456123"
        
        let str1 = str.gy_stringValue()
        
        print(str1 ?? "")
        
        
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        btn.center = self.view.center
        btn.setTitle("你好", for: UIControlState.normal)
        btn.backgroundColor = UIColor.blue
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(ViewController.request12), for: UIControlEvents.touchUpInside)
        
     
     
        
    }

    func request12() {
        print("1")
        request("www.baidu.com").response { (data) in
            print("123")
        }
        print("3")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

