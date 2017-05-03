//
//  HomeViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {

    var scrollerView : MyCustomScrollerView?
    var heaerView = MatchHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataSource()
        createUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    func getDataSource()  {
        let homeApi = HomeApi()
       homeApi.getHomeData { (newsList, matchModel, error) in
        self.dataSource = newsList
        self.tabelView.reloadData()
    }
    }
    
    func createUI() {
        self.title = "首页"
        self.hiddenRefresh = true
        if scrollerView == nil {
            
            scrollerView = MyCustomScrollerView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W, height: 150))
            scrollerView?.setUpUI(array: [UIColor.red,UIColor.yellow,UIColor.green], titleArray: ["红色","黄色","绿色"])
        }
        heaerView = MatchHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W, height: 150))
        self.tabelView.tableHeaderView = heaerView
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 80
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 1
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
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
