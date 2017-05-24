//
//  SessionTopCell.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/18.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class SessionTopCell: UITableViewCell {
    var titleLabel = UILabel()
    
    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override init(style:UITableViewCellStyle ,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        let imageLine = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width:ScreenWidth, height: 0.5))
        imageLine.backgroundColor = UIColor.gray
        self.addSubview(imageLine)
        
        let lable = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: 40, height: 20))
        lable.text = "置顶"
        lable.font = UIFont.systemFont(ofSize: 13)
        lable.textAlignment = .center
        lable.textColor = .purple
        lable.layer.masksToBounds = true
        lable.layer.cornerRadius = 3
        lable.layer.borderColor = UIColor.purple.cgColor
        lable.layer.borderWidth = 0.5
        self.addSubview(lable)
        
        titleLabel = UILabel.init(frame: CGRect.init(x: lable.frame.maxX + 10, y: lable.frame.minY, width: ScreenWidth - lable.frame.maxX - 20, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = UIColor.darkText
        self.addSubview(titleLabel)
        
    }
    
    func updateSessionTopCell(model:SessionTopTopicModel) {
        titleLabel.text = model.title
        
         
    }

}
