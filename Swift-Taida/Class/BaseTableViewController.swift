//
//  BaseTableViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import MJRefresh

class BaseTableViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataSource  = [Any]()
    var down = false
    var hiddenRefresh = false
    var myTabelView = UITableView()
    var customerLogin : CustomerLoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        myTabelView = UITableView.init(frame: CGRect.init(x: 0, y:0, width: UIScreen_W, height: UIScreen_H), style: .plain)
        myTabelView.separatorStyle = .none
        myTabelView.delegate = self
        myTabelView.dataSource = self
        self.view.addSubview(myTabelView)
        //普通带文字下拉刷新的定义
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(BaseTableViewController.headerRefresh))
        self.myTabelView.mj_header = header
        //普通带文字上拉加载的定义
         let footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(BaseTableViewController.footerRefresh))
        footer?.setTitle("", for: .idle)
        self.myTabelView.mj_footer = footer
        customerLogin = CustomerLoadingView.init(frame: CGRect.init(x: (ScreenWidth - 100)/2, y: (ScreenHeight - 100)/2, width: 100, height: 100))
        let window = UIApplication.shared.windows.last!
        customerLogin?.isHidden = true
        window.addSubview(customerLogin!)
        // Do any additional setup after loading the view.
    }
    
    //取消刷新
    func cancelHeader() {

        self.myTabelView.mj_header.isHidden = true
    }
    
    //取消加载
    func cancelFooter() {
        
        self.myTabelView.mj_footer.isHidden = true
    }

    func headerRefresh() {
        customerLogin?.isHidden = false
        customerLogin?.paly()
        self.myTabelView.isUserInteractionEnabled = false

        //子类需要重写
        
    }
    
    func finishRefesh() {
        customerLogin?.stopPlay()
        customerLogin?.isHidden = true
        self.myTabelView.mj_header.endRefreshing()
        self.myTabelView.mj_footer.endRefreshing()
        self.myTabelView.isUserInteractionEnabled = true



    }
    
    func footerRefresh()  {
        customerLogin?.paly()
        customerLogin?.isHidden = false
        self.myTabelView.isUserInteractionEnabled = false

        //子类需要重写

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
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
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
