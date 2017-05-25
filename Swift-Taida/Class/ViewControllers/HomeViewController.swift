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
    let newsApi = NewsListApi()
    var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerRefresh()
//        getDataSource()
        createUI()
        // Do any additional setup after loading the view.
    }
    
    func getDataSource()  {
        let homeApi = HomeApi()
       homeApi.getHomeData { (newsList, matchModel,imageArray, error) in
        self.dataSource = newsList
        self.myTabelView.reloadData()
        var imageString = [String]()
        for model:HomeModel in imageArray {
            imageString.append(model.logo!)
        }
        self.scrollerView?.setUpUI(array: imageString)
        self.finishRefesh()

        }
    }
    
    func createUI() {
        self.title = "首页"
        self.hiddenRefresh = true
        if scrollerView == nil {
            
            scrollerView = MyCustomScrollerView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W, height: 150))
            
        }
        heaerView = MatchHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen_W, height: 150))
        self.myTabelView.tableHeaderView = scrollerView!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:BaseTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as? BaseTableViewCell
        
        if cell == nil {
            
            cell=BaseTableViewCell(style: .default, reuseIdentifier: "cell")
        }
        if self.dataSource.count > 0 {
            let model = self.dataSource[indexPath.row]
            cell.updateUI(model: model as! HomeModel)
        }
       
        return cell as UITableViewCell
    }
    
    override func headerRefresh() {
        super.headerRefresh()
        pageNumber = 1
        self.dataSource.removeAll()
        self.getDataSource()
    }
    
    override func footerRefresh() {
        super.footerRefresh()
        newsApi.getNewsList(pageNumber: pageNumber, finished: {resposeArray,success in
            self.dataSource = self.dataSource as![HomeModel] + resposeArray
            self.myTabelView.reloadData()
            self.finishRefesh()

        })
        pageNumber += 1
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
