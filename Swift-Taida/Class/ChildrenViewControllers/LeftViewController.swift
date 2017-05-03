//
//  LeftViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/7.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
class LeftViewController: UIViewController,UITextFieldDelegate{
    
    var coreData = CoreDataHelp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        self.view.backgroundColor = UIColor.orange
        
    }
    
    
    func createUI() {
        for i in 0..<2 {
            let textFiled = UITextField.init(frame: CGRect.init(x: 30, y: i *  50 + 10, width: 100, height: 30))
            textFiled.tag = 200 + i
            textFiled.backgroundColor = UIColor.white
            textFiled.delegate = self
            self.view.addSubview(textFiled)
            
            let button = UIButton.init(type: .custom)
            button.frame = CGRect.init(x: textFiled.frame.maxX + 10, y: textFiled.frame.minY, width: 60, height: 30)
            button.backgroundColor = UIColor.white
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
            if i == 0 {
                button .setTitle("保存", for: .normal)
            }else{
                button .setTitle("查询", for: .normal)
                
            }
            button .setTitleColor(UIColor.black, for: .normal)
            button.tag = 100 + i
            button .addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
            self.view.addSubview(button)
            
        }
    }
    func buttonAction(button:UIButton) {
        if button.tag - 100 == 0 {
            let textFiled = self.view.viewWithTag(200) as? UITextField
            coreData.addData()
        }else{
            coreData.search()
            let textFiled = self.view.viewWithTag(201) as? UITextField
        }
        print(button.titleLabel?.text ?? "错误")
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
