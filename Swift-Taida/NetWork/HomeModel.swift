//
//  HomeModel.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/27.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit
class HomeModel: BaseModel {

    var abstracts:String?
    var contents:String?
    var createTime:Int?
    var id:Int?
    var links:String?
    var logo:String?
    var newsTypeName:String?
    var title:String?
    

    required init () {
       super.init()
    }
}
