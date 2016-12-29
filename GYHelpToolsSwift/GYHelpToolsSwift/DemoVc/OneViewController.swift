//
//  OneViewController.swift
//  GYHelpToolsSwift
//
//  Created by ZGY on 2016/12/29.
//  Copyright © 2016年 Giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2016/12/29  14:36
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class OneViewController: UIViewController {
    
    //MARK: - Attributes
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.gy_width, height: self.view.gy_height)
        tableView.backgroundColor = UIColor.blue
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
//        let viewSB = UIView()
//        
//        viewSB.frame = CGRect(x: 0, y: 0, width: self.view.gy_width, height: self.view.gy_height)
//        viewSB.backgroundColor = UIColor.red
//        
//        view.addSubview(viewSB)
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


extension OneViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundColor = UIColor.white
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let next = NextViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    
}
