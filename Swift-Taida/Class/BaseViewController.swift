//
//  BaseViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {

    let UIScreen_W = UIScreen.main.bounds.width
    let UIScreen_H = UIScreen.main.bounds.height
    var showLeft = true //如果为false，需要在子类从写func leftAction()事件
    var first  = true
    var leftView  = LeftViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let leftSwip = UIPanGestureRecognizer.init(target: self, action: #selector(leftSwip(leftSwip:)))
        
        self.view.addGestureRecognizer(leftSwip)
       
    }
    
    func leftSwip(leftSwip:UIPanGestureRecognizer) {
       
        let x = leftSwip.translation(in: self.view).x
        if x < 0 {
            self.tabBarController?.view.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)


        }else if x > ScreenWidth/3 * 2 {
            self.tabBarController?.view.frame = CGRect.init(x: ScreenWidth/3 * 2, y: 0, width: ScreenWidth, height: ScreenHeight)
            
 
        }else{
            self.tabBarController?.view.frame = CGRect.init(x: x, y: 0, width: ScreenWidth, height: ScreenHeight)
            
        }
        print(x)
    }
    //需要在子类中调用才能实现
    func leftButton(imageString:String)  {
//        let barButton = UIBarButtonItem.init(image: UIImage.init(named: imageString), style: .plain, target: self, action: #selector(self.leftAction))
        let barButton = UIBarButtonItem.init(title: imageString, style: .plain, target: self, action: #selector(self.leftAction))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func leftAction() {
        if showLeft == true {
            if first == true {
                self.tabBarController?.view.frame = CGRect.init(x: ScreenWidth/3 * 2, y: 0, width: ScreenWidth, height: ScreenHeight)
                first = false
            }else{
                self.tabBarController?.view.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)

                first = true
            }
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
