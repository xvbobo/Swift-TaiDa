//
//  LoginView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/10.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class LoginView: UIView {

    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        self.setUpUI()
    }
    func setUpUI() {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.tapAction))
        let headerIView = UIImageView.init(frame: CGRect.init(x: (frame.width - 80)/2, y: 30, width: 80, height: 80))
        headerIView.isUserInteractionEnabled = true
        headerIView.image = UIImage.init(named: "header")
        headerIView.layer.masksToBounds = true
        headerIView.layer.cornerRadius = 40
        headerIView.addGestureRecognizer(tap)
        self.addSubview(headerIView)
        
        let labelName = UILabel.init(frame: CGRect.init(x: 0, y: headerIView.frame.maxY + 15, width: frame.width, height: 15))
        labelName.text = "姓名：许菠菠"
        labelName.textColor = UIColor.white
        labelName.font = UIFont.systemFont(ofSize: 14)
        labelName.textAlignment = .center
        self.addSubview(labelName)
        
        let labelPhone = UILabel.init(frame: CGRect.init(x: 0, y: labelName.frame.maxY + 15, width: frame.width, height: 15))
        labelPhone.text = "电话：15962532973"
        labelPhone.textColor = UIColor.white
        labelPhone.font = UIFont.systemFont(ofSize: 14)
        labelPhone.textAlignment = .center
        self.addSubview(labelPhone)

        
    }
    func tapAction()  {
        print("click header")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
