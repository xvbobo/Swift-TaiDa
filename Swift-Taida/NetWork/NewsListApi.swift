//
//  NewsListApi.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/18.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class NewsListApi: NSObject {
    var manger = URLManger()
    let homoModel = HomeModel()
    var homeArray = [HomeModel]()
    
    
    override init() {
        
        super.init()
    }
   
    public func getNewsList(pageNumber:Int,finished:@escaping (_ responseArray:[HomeModel],_ success:String?)->()){
        let pageNo = "\(pageNumber)"
        Alamofire.request(manger.requestNewListURL(typeString: "all"), method: .get, parameters: ["pageSize":"10","pageNo":pageNo,"canPage":"1"]).responseJSON { (response) in
            if response.result.isSuccess {
                var newsModelArray = [HomeModel]();
                let dict = response.result.value as! NSDictionary
                
                let newsList = dict["list"] as! NSArray//新闻数组
                
                for newsDict in newsList {
                    let newsModel = JSONDeserializer<HomeModel>.deserializeFrom(dict: newsDict as? NSDictionary)
                    if (newsModel != nil) {
                        newsModelArray.append(newsModel!)
                    }
                    
                }
                finished(newsModelArray,"成功")

            }else {
                finished([],"失败")

            }
            
            
        }
    }

}
