//
//  SwitchViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/7.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class SwitchViewController: UIView ,UIScrollViewDelegate{

    private var buttonArr = [UIButton]()
    private var viewsArr = [UIView]()
    private var myScrollerView = UIScrollView()
    override init(frame:CGRect) {
        super.init(frame: frame)
        print(frame)
        print(ScreenWidth,ScreenHeight)
        myScrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 40, width: frame.width, height: frame.height - 40))
        myScrollerView.decelerationRate = 0
        myScrollerView.backgroundColor = UIColor.white
        myScrollerView.showsHorizontalScrollIndicator = false
        myScrollerView.showsVerticalScrollIndicator = false
        myScrollerView.isPagingEnabled = true
        myScrollerView.delegate = self
        self.addSubview(myScrollerView)
        self.backgroundColor = UIColor.red
    }
    func setUI (buttonArr buttonNames:Array<String>, views chridrenViews:Array<UIView>) {
    
        viewsArr = chridrenViews
        myScrollerView.contentSize = CGSize.init(width: CGFloat(viewsArr.count) * myScrollerView.frame.width, height: 0)
        let buttonW = frame.width/CGFloat(buttonNames.count)
        
        for i in 0..<buttonNames.count {
            let tabButton = UIButton.init(type: .custom)
            tabButton.frame = CGRect.init(x: CGFloat(i) * buttonW, y: 0, width: buttonW, height: 40)
            if i == 0 {
                tabButton.setTitleColor(UIColor.red, for: .normal)
            }else{
                tabButton.setTitleColor(UIColor.black, for: .normal)

            }
            tabButton.backgroundColor = UIColor.white
            tabButton.setTitle(buttonNames[i], for: .normal)
            buttonArr.append(tabButton)
            self.addSubview(tabButton)
        }
        for j in 0..<viewsArr.count {
            let childrenView = viewsArr[j]

            childrenView.frame = CGRect.init(x: CGFloat(j) * myScrollerView.frame.width , y: -64, width: frame.width, height: myScrollerView.frame.height)
            myScrollerView.addSubview(childrenView)
            print(childrenView.frame)
        }
        print(myScrollerView.frame)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = NSInteger(scrollView.contentOffset.x/scrollView.frame.width)
        for i in 0..<buttonArr.count {
            let button = buttonArr[i]
            if i == index {
                button.setTitleColor(UIColor.red, for: .normal)
            }else{
                button.setTitleColor(UIColor.black, for: .normal)
            }
        }
        print(index)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
