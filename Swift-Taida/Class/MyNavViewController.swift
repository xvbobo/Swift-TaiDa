//
//  MyNavViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/27.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class MyNavViewController: UINavigationController {

    let UIScreen_W = UIScreen.main.bounds.width
    let UIScreen_H = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
               // Do any additional setup after loading the view.
    }
    func titleView () -> UIView {
        let label  = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W/2, height: 30))
        label.backgroundColor = UIColor.red
        label.text = "手特"
        return label
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
