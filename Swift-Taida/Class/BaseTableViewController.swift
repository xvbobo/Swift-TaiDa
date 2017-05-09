//
//  BaseTableViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    

    var dataSource  = [Any]()
    var down = false
    var hiddenRefresh = false
    var myTabelView = UITableView()
    var refreshView = MyRefreshView()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshView.isHidden = hiddenRefresh
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "首页"
        myTabelView = UITableView.init(frame: CGRect.init(x: 0, y:0, width: UIScreen_W, height: UIScreen_H), style: .plain)
        myTabelView.separatorStyle = .none
        myTabelView.delegate = self
        myTabelView.dataSource = self
        self.view.addSubview(myTabelView)
        
        
        setRefreshView()
        // Do any additional setup after loading the view.
    }
    func setRefreshView() {
        refreshView = MyRefreshView.init(frame: CGRect.init(x: 0, y: -40, width: ScreenWidth, height: 40))
        refreshView.backgroundColor = UIColor.yellow
        self.view.addSubview(refreshView)
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
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "resueIdentifier")
        }
        return cell!
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if hiddenRefresh == true {
            return
        }
        if scrollView.contentOffset.y > 0 {
            down = true
        }else{
            down = false
        }
        if scrollView.contentOffset.y < -64 {
            if scrollView.contentOffset.y + scrollView.frame.size.height < scrollView.contentSize.height{
                refreshView.frame = CGRect.init(x: 0, y: 64, width: ScreenWidth, height: 40)
                myTabelView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
            }else{
                myTabelView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            }

        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if hiddenRefresh == true {
            return
        }
        if down == true {
            return
        }
        self.refreshView.frame = CGRect.init(x: 0, y: -40, width: ScreenWidth, height: 40)
        scrollView.contentInset = UIEdgeInsetsMake(64, 0.0, 0.0, 0.0)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
