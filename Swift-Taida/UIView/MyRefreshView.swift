//
//  MyRefreshView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/20.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class MyRefreshView: UIView {

    var topLayer: CALayer?//顶部线
    var middleLayer: CALayer?//中间线
    var bottomLayer: CALayer?//底部线
    
    var textLayer: CATextLayer?//REFRESH文字
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()//设置
    }
    /**
     设置
     */
    func setup(){
        //顶部线
        topLayer = CALayer()
        topLayer!.backgroundColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0).cgColor
        topLayer!.frame = CGRect.init(x: 98, y: 0, width: 4, height: 4)
        topLayer!.cornerRadius = 2
        self.layer.addSublayer(topLayer!)
        
        //中间线
        middleLayer = CALayer()
        middleLayer!.backgroundColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0).cgColor
        middleLayer!.frame = CGRect.init(x: 98, y: 14, width: 4, height: 4)
        middleLayer!.cornerRadius = 2
        self.layer.addSublayer(middleLayer!)
        
        //底部线
        bottomLayer = CALayer()
        bottomLayer!.backgroundColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0).cgColor
        bottomLayer!.frame = CGRect.init(x: 98, y: 28, width: 4, height: 4)
        bottomLayer!.cornerRadius = 2
        self.layer.addSublayer(bottomLayer!)
        
        //REFRESH
        textLayer = CATextLayer()
        textLayer!.foregroundColor = UIColor(red: 64/255.0, green: 64/255.0, blue: 64/255.0, alpha: 1.0).cgColor
        textLayer!.fontSize = 10
        textLayer!.contentsScale = UIScreen.main.scale
        textLayer!.string = "REFRESH"
        textLayer!.opacity = 0
        textLayer!.frame = CGRect.init(x: 75, y: 62, width: 50, height: 20)
        self.layer.addSublayer(textLayer!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
