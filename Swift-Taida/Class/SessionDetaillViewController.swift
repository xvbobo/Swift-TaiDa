//
//  SessionDetaillViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/25.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class SessionDetaillViewController: BaseTableViewController {

    var topModel:SessionTopicModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "圈子详情"
        print(topModel?.content ?? "")
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
