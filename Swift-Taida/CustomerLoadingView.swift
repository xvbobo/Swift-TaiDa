//
//  CustomerLoadingView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/25.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class CustomerLoadingView: UIView {
    
  let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    override init(frame:CGRect){
        super.init(frame: frame)
        let backView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height))
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        backView.backgroundColor = UIColor.black
        backView.alpha = 0.5
        activityIndicator.center = backView.center
        backView.addSubview(activityIndicator)
        self.addSubview(backView)
    }
    
    func paly ()  {
        activityIndicator.startAnimating()
    }
    
    func stopPlay() {
        activityIndicator.stopAnimating()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
