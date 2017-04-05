//
//  BaseViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {

    let UIScreen_W = UIScreen.main.bounds.width
    let UIScreen_H = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        // Do any additional setup after loading the view.
               
    }
    func getData() {
   
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
