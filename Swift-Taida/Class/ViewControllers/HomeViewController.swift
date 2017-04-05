//
//  HomeViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tabelView = UITableView()
    var headerView : HeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "首页"
        tabelView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W, height: UIScreen_H), style: .plain)
        tabelView.separatorStyle = .none
        tabelView.delegate = self
        tabelView.dataSource = self
        self.view.addSubview(tabelView)
        
        if headerView == nil {
            headerView = HeaderView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 100))
            headerView?.setUpUI(array: ["123","345","678"]) 
        }
        self.tabelView.tableHeaderView = headerView
//        let calerdarView = CalendarView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
//        calerdarView.backgroundColor = UIColor.white
//        calerdarView.center = self.view.center
//        self.view.addSubview(calerdarView)
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
