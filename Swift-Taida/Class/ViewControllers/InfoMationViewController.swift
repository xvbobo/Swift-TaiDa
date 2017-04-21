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
        let loginView = LoginView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenWidth, height: 200))
        self.view.addSubview(loginView)
        
        let animationView = AnimationView.init(frame: CGRect.init(x: 0, y: loginView.frame.maxY, width: ScreenWidth, height: self.view.frame.height - loginView.frame.height))
        self.view.addSubview(animationView)
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
