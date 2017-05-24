//
//  SessionHeaderView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/18.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class SessionHeaderView: UITableViewCell {

    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override init(style:UITableViewCellStyle ,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self .createSessionHeaderView(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 130))
        
    }
    
    func createSessionHeaderView(frame:CGRect) {
        let backView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 130))
        backView.backgroundColor = .white
        let headerImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: frame.height - 30))
        headerImageView.backgroundColor = .red
        headerImageView.image = UIImage.init(named: "session_header_image")
        backView.addSubview(headerImageView)
        
        let logoImageView = UIImageView.init(frame: CGRect.init(x: 30, y: headerImageView.frame.height - 20, width: 20, height: 30))
        logoImageView.image = UIImage.init(named: "session_taida_logo")
        backView.insertSubview(logoImageView, aboveSubview: headerImageView)
        
        self.addSubview(backView)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
