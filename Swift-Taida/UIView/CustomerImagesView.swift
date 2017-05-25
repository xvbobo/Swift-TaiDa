//
//  CustomerImagesView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/24.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import AlamofireImage

class CustomerImagesView: UIView {

    
    var imageViews = [UIImageView]()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    func updateImagsView(imagesUrl:[String]) {
        
        for view in self.subviews {
            let imageView = view as! UIImageView
            imageView.removeFromSuperview()
        }
        
        imageViews.removeAll()
        for (_,value) in imagesUrl.enumerated() {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.gray
            let urlString = NSURL.init(string: value)
            imageView.af_setImage(withURL: urlString! as URL)
            imageViews.append(imageView)
        }
        self.setNeedsLayout()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageWidth = Int(ScreenWidth - 36)/3

        for (idx,imageView) in imageViews.enumerated() {
            imageView.frame = CGRect.init(x: idx * (imageWidth + 10), y: 0, width: imageWidth, height: imageWidth)
            self.addSubview(imageView)


        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
