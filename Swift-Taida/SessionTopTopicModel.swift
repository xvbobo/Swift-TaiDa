//
//  SessionTopTopicModel.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/23.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class SessionTopTopicModel: BaseModel {

    var content:String?
    var contents:String?
    var createdAt:String?
    var praiseCount:String?
    var replyCount:String?

    var topicId:String?
    var title:String?
    var timestamp:String?
    var user:NSDictionary?
    var imageList: NSArray?
    
    required init () {
        super.init()
    }

}
