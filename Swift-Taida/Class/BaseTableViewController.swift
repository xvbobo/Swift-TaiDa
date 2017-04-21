//
//  BaseTableViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    

    var dataSource  = [String]()
    
    var tabelView = UITableView()
    var headerView : HeaderView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "首页"
        tabelView = UITableView.init(frame: CGRect.init(x: 0, y:0, width: UIScreen_W, height: UIScreen_H), style: .plain)
        tabelView.separatorStyle = .none
        tabelView.delegate = self
        tabelView.dataSource = self
        self.view.addSubview(tabelView)
        
        if headerView == nil {
            
            headerView = HeaderView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W, height: 150))
            headerView?.setUpUI(array: [UIColor.red,UIColor.yellow,UIColor.green], titleArray: ["红色","黄色","绿色"])
        }
        self.tabelView.tableHeaderView = headerView
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    

}
