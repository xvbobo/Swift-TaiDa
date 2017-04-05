//
//  URLManger.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class URLManger: NSObject {
    let kbaseURL = "https://tianjinfc-t.9h-sports.com";//测试服
//    let kbaseURL = "https://tianjinfc.9h-sports.com";//正式服
    public let kURLStringFirstPage = "/club/home";//首页数据
    override init () {
        super.init()
    }
    public func requestURLGenerateWithURL(path:String) -> String {
        return kbaseURL + path;
    }
    

}
