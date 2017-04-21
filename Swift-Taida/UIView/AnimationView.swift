//
//  AnimationView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/10.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    //游戏方格维度
    var dimension:Int = 4
    //数字格子的宽度
    var width:CGFloat = 40
    //格子与格子的间距
    var padding:CGFloat = 6
    
    var backgrounds:Array<UIView>!
    
    override init (frame:CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        self.backgrounds = Array<UIView>()
        setGameMap()
        playAnimation()
        
    }
    
    func setGameMap() {
        var  x : CGFloat = 50
        var  y : CGFloat = 50
        for i in 0..<dimension {
            y = 50
            for _  in 0..<dimension {
                let backGround = UIView.init(frame: CGRect.init(x: x, y:y, width: width, height: width))
                backGround.backgroundColor = UIColor.gray
                self.addSubview(backGround)
                backgrounds.append(backGround)
                y += padding + width
            }
            x += padding + width
        }
        
        
    }
    
    func playAnimation() {
        
        for title in backgrounds {
            //先将数字块大小置为原始尺寸的 1/10
//            title.layer.setAffineTransform(CGAffineTransform.init(scaleX: 0.1, y: 0.1))
                    title.alpha = 0;
                        //设置动画效果，动画时间长度 1 秒。
        UIView.animate(withDuration: 1, delay: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: {
//                            title.layer.setAffineTransform(CGAffineTransform(scaleX: 1,y: 1))
//            title.layer.setAffineTransform(CGAffineTransform.init(rotationAngle: 90))
           }, completion: { (finish:Bool) in
            UIView.animate(withDuration: 1, animations: {
                title.alpha = 1
//                title.layer.setAffineTransform(CGAffineTransform.identity)
            })
           })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
