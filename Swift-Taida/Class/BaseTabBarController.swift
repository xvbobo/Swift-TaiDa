//
//  BaseTabBarController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor.white

        let home = HomeViewController()
        home.tabBarItem.title = "首页"
        home.tabBarItem.selectedImage = UIImage.init(named: "item_home_selected")
        home.tabBarItem.image = UIImage.init(named: "item_home_unselected")
        
        let session = SessionViewController()
        session.tabBarItem.title = "圈子"
        session.tabBarItem.selectedImage = UIImage.init(named: "item_session_selected")
        session.tabBarItem.image = UIImage.init(named: "item_session_unselected")
        
        let infoMation = InfoMationViewController()
        infoMation.tabBarItem.title = "我的"
        infoMation.tabBarItem.selectedImage = UIImage.init(named: "item_user_selected")
        infoMation.tabBarItem.image = UIImage.init(named: "item_user_unselected")
        //图片消除蓝色效果
        infoMation.tabBarItem.selectedImage = infoMation.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        home.tabBarItem.selectedImage = home.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        session.tabBarItem.selectedImage = session.tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);

        
        
        let nvc1 = MyNavViewController(rootViewController:home);
        let nvc2 = MyNavViewController(rootViewController:session);
        let nvc3 = MyNavViewController(rootViewController:infoMation);

        self.viewControllers = [nvc1,nvc3,nvc2]
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
