//
//  DetailViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/10.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class DetailViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.title = "详情"
        self.dataSource = ["1","1","1","1","1","1","1","1","1","1","1","1"]
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "resueIdentifier")
        if cell == nil {
            cell = BaseTableViewCell.init(style: .default, reuseIdentifier: "resueIdentifier")
        }
        return cell!
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
