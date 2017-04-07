//
//  InfoMationViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class InfoMationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        let leftViewController = LeftViewController()
        let centerViewController = CenterViewController()
        let rightViewController = RightViewController()
        
        let switchView = SwitchViewController.init(frame:CGRect.init(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 64 - 50))
        switchView.setUI(buttonArr: ["向左","居中","向右"], views: [leftViewController.view,centerViewController.view,rightViewController.view])
        self.view.addSubview(switchView)
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
