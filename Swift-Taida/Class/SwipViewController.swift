//
//  SwipViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/25.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class SwipViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let baseViewController = BaseTabBarController()
        self.addChildViewController(baseViewController)
        self.view.addSubview(baseViewController.view)
        
        let leftViewController = SideViewController()
        self.addChildViewController(leftViewController)
        leftViewController.view.frame = CGRect.init(x:0, y: 0, width: ScreenWidth/3 * 2, height: ScreenHeight)
        self.view.insertSubview(leftViewController.view, belowSubview: baseViewController.view)
        
        
        // Do any additional setup after loading the view.
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
