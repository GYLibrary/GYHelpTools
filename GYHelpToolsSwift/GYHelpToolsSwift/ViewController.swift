//
//  ViewController.swift
//  GYHelpToolsSwift
//
//  Created by zhuguangyang on 2016/11/23.
//  Copyright © 2016年 Giant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = "   123456123"
        
        let str1 = str.gy_stringValue()
        
        print(str1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

