//
//  CalendarCell.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/1/22.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    var weekLabel : UILabel!
    override init(frame:CGRect) {
        super.init(frame: frame )
        weekLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height))
        weekLabel.textAlignment = .center
        weekLabel.textColor = UIColor.black
        weekLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(weekLabel)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
