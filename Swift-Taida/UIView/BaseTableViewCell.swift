//
//  BaseTableViewCell.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    var leftImageView  = UIImageView()
    var titleLable = UILabel()
    
    
    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)!
    
    }
    
    override init(style:UITableViewCellStyle ,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setUpUI()
    }

    func setUpUI() {
        self.backgroundColor = UIColor.white
        let imageLine = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width:ScreenWidth, height: 0.5))
        imageLine.backgroundColor = UIColor.gray
        self.addSubview(imageLine)
        leftImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 100, height: 60))
        leftImageView.backgroundColor = UIColor.red
        self.addSubview(leftImageView)
        
        titleLable = UILabel.init(frame: CGRect.init(x: leftImageView.frame.maxX, y: leftImageView.frame.minY, width: ScreenWidth - 10 - leftImageView.frame.maxX , height: 40))
        titleLable.textColor = UIColor.black
        titleLable.numberOfLines = 0
        titleLable.font = UIFont.systemFont(ofSize: 15)
        titleLable.text = "今天天气不错，适合出去游玩，你们准备好了吗？"
        self.addSubview(titleLable)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
