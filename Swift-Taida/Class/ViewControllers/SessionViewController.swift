//
//  SessionViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class SessionViewController: BaseTableViewController {

    var sessionHeader = SessionHeaderView()
    var sessionApi = SessonListApi()
    var topArray = [SessionTopTopicModel]()
    var sessionListArray = [SessionTopicModel]()
    let sessionListCell = SessionListCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "圈子"
        self.view.backgroundColor = UIColor.white
        self.cancelHeader()
        
        sessionHeader.createSessionHeaderView(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 130))
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sessionApi.getSessionList(pageNumber: 1, finished: { topArray,topicsArray,success in
            if Int(success!)! == 1 {
                
                self.topArray = topArray
                self.sessionListArray = topicsArray
                self.myTabelView.reloadData()
//                print(self.sessionListArray)
//                print(self.topArray)

            }
            
        })
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.sessionListArray.count > 0 && self.topArray.count > 0 {
            if indexPath.row == 0 {
                return 130
            }else if indexPath.row < self.topArray.count + 1 && indexPath.row > 0{
                return 30
            }else if indexPath.row > self.topArray.count {
                let seeionListModle = self.sessionListArray[indexPath.row - self.topArray.count - 1]
                let height = sessionListCell.getSessionListCellHeight(model: seeionListModle)
                return height + 80
            }else {
                return 0
            }

        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.sessionListArray.count > 0 {
            return self.sessionListArray.count + self.topArray.count + 1
        }else{
            return 0
 
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            var cell0:SessionHeaderView! = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? SessionHeaderView
            if cell0 == nil {
                cell0 = SessionHeaderView.init(style: .default, reuseIdentifier: "headerCell")
            }
            return cell0

        }else if indexPath.row < self.topArray.count + 1 && indexPath.row > 0 {
            
            var cell1:SessionTopCell! = tableView.dequeueReusableCell(withIdentifier: "topCell") as? SessionTopCell
            if cell1 == nil {
                cell1 = SessionTopCell.init(style: .default, reuseIdentifier: "topCell")
            }
            if self.topArray.count > 0 {
                if indexPath.row - 1 < self.topArray.count || indexPath.row - 1 == self.topArray.count {
                    cell1.updateSessionTopCell(model: self.topArray[indexPath.row - 1] )
                    
                }
            }
           
            return cell1
            
        }else{
            
            let  cellIdentifier = "listCell"
            
            var cell2:SessionListCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SessionListCell
            if cell2 == nil {
                cell2 = SessionListCell.init(style: .default, reuseIdentifier: cellIdentifier)
            }

            if self.sessionListArray.count > 0 {
                if indexPath.row - self.topArray.count - 1 < self.sessionListArray.count || indexPath.row - self.topArray.count - 1 == self.sessionListArray.count {
                    cell2.updateSessionLiseCell(model: self.sessionListArray[indexPath.row - self.topArray.count - 1])
                }
            }
            return cell2

        }
        
        
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
