//
//  HeaderView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class HeaderView: UIView,UIScrollViewDelegate{

    var myScrollerView = UIScrollView()
    var leftImageView = UIImageView()
    var centerImageView = UIImageView()
    var rightImageView = UIImageView()
    var currentImageIndex = 0;
    var imageArray = [AnyObject]()
    var imageViews = [UIImageView]()
   
    
    private var titleArr = [String]()
    var timer = Timer()
    override init(frame:CGRect){
        super.init(frame:frame)
        
    }
    func userInterFace() {
        myScrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height))

        myScrollerView.contentOffset = CGPoint.init(x: myScrollerView.frame.width, y: 0)
        myScrollerView.contentSize = CGSize.init(width: frame.width * 3, height: frame.height)
        myScrollerView.isPagingEnabled = true
        myScrollerView.showsHorizontalScrollIndicator = false
        myScrollerView.delegate = self
        self.addSubview(myScrollerView)
        for i in 0...3 {
            let imageView = UIImageView.init(frame: CGRect.init(x:CGFloat(i) * myScrollerView.frame.width, y: 0, width: myScrollerView.frame.width, height: myScrollerView.frame.height))
            let label = UILabel.init(frame: CGRect.init(x: 0, y: imageView.frame.height - 20, width: imageView.frame.width, height: 20))
            label.textColor = UIColor.white
            imageView.addSubview(label)
            if i == 0 && imageArray.count > 1 {
                imageView.backgroundColor = imageArray[imageArray.count - 1] as? UIColor //左边
                label.text = titleArr[titleArr.count - 1]

            }
            if i == 1 && imageArray.count > 0 {
                imageView.backgroundColor = imageArray[0] as? UIColor //左边
                label.text = titleArr[0]

            }
            if i == 2 && imageArray.count > 1 {
                imageView.backgroundColor = imageArray[1] as? UIColor//右边
                label.text = titleArr[1]

            }
            imageViews.append(imageView)
            myScrollerView.addSubview(imageView)
        }

    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //启动定时器
        timer.fireDate = NSDate.distantFuture
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var leftImageIndex = 0
        var rightImageIndex = 0
        let offset = scrollView.contentOffset
        if offset.x > frame.width {
            //向右
            currentImageIndex = (currentImageIndex + 1) % imageArray.count
        }else if offset.x < frame.width {
            currentImageIndex = (currentImageIndex + imageArray.count - 1 ) % imageArray.count
        }
        //  重新设置左右图片
        let  centerImageView = imageViews[1]
        let centerLable = centerImageView.subviews.first as? UILabel
        let  leftImageView = imageViews[0]
        let leftLable = leftImageView.subviews.first as? UILabel

        let  rightImageView = imageViews[2]
        let rightLabel = rightImageView.subviews.first as? UILabel
        
        centerImageView.backgroundColor = imageArray[currentImageIndex] as? UIColor;
        centerLable?.text = titleArr[currentImageIndex]
        
        leftImageIndex  = (currentImageIndex + imageArray.count - 1) % imageArray.count ;
        rightImageIndex = (currentImageIndex + 1) % imageArray.count ;
        
        leftImageView.backgroundColor  = imageArray[leftImageIndex] as? UIColor ;
        leftLable?.text = titleArr[leftImageIndex]
        
        rightImageView.backgroundColor = imageArray[rightImageIndex] as? UIColor ;
        rightLabel?.text = titleArr[rightImageIndex]
        
        scrollView .setContentOffset(CGPoint.init(x: scrollView.frame.width, y: 0), animated: false)
        
    }
    func setUpUI(array imageArr:Array<AnyObject> ,titleArray titleOutArray:Array<String>) {
        imageArray = imageArr
        titleArr = titleOutArray
        self.userInterFace()

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
