//
//  URLManger.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class URLManger: NSObject {
//    let kbaseURL = "https://tianjinfc-t.9h-sports.com";//测试服
    let kbaseURL = "https://tianjinfc.9h-sports.com";//正式服
    public let kURLStringFirstPage = "/club/home";//首页数据
    public let kURLStringAllTypeNews = "/club/news/0?";//所有新闻
    public let kURLStringNews = "/club/news/1?";//新闻公告
    public let kURLStringTeam = "/club/news/2?";//球队
    public let kURLStringMatch = "/club/news/3?";//比赛
    public let kURLStringVideo = "/club/news/4?";//视频
    public let kURLStringReadCounts = "/club//news/times/%@";//阅读数
    public let kURLStringSessionHomeData = "/v1/group/gateway/sections/11";//圈子首页

    
    override init () {
        super.init()
    }
    
    public func requestURLGenerateWithURL(path:String) -> String {
        return kbaseURL + path;
    }
    
    public func requestNewListURL(typeString:String) -> String {
        switch typeString {
        case "all":
            return kbaseURL + kURLStringAllTypeNews
        case "team":
            return kbaseURL + kURLStringTeam
        case "match":
            return kbaseURL + kURLStringMatch
        case "video":
            return kbaseURL + kURLStringVideo


        default:
            return "";
        }
    }
    
    public func requestSessionURL(path:String) -> String {
        return kbaseURL + kURLStringSessionHomeData;
    }

}
