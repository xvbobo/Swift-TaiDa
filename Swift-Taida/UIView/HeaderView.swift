//
//  HeaderView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/4.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class HeaderView: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    var scrollerView  = UICollectionView()
    
    override init(frame:CGRect){
        super.init(frame:frame)
        let layout = UICollectionViewFlowLayout()
        scrollerView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        //注册一个cell
//        scrollerView! .registerClass(Home_Cell.self, forCellWithReuseIdentifier:"cell")
//        //注册一个headView
//        scrollerView! .registerClass(Home_HeadView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        scrollerView.delegate = self;
        scrollerView.dataSource = self;
        
        scrollerView.backgroundColor = UIColor.white
        //设置每一个cell的宽高
        layout.itemSize = CGSize.init(width: frame.width, height: frame.height)
        self.addSubview(scrollerView)
    }
    // #MARK: --UICollectionViewDataSource的代理方法
    /**
     - 该方法是可选方法，默认为1
     - returns: CollectionView中section的个数
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     - returns: Section中Item的个数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    /**
     - returns: 绘制collectionView的cell
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath)
        
        return cell  
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("123")
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    
    func setUpUI(array imageArray:Array<String>) {
        print(imageArray)
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
