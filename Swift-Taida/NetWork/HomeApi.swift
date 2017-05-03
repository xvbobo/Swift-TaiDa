//
//  HomeApi.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON


class HomeApi: NSObject {
    var manger = URLManger()
    let homoModel = HomeModel()
    var homeArray = [HomeModel]()
    
    let calAdd:(Int,Int) -> (Int) = {
        a,b in
        return a + b
    }
    
    override init() {
        
        super.init()
   }
    func clickBtn()  {
    }
    public func getHomeData(finished:@escaping (_ responseArray:[HomeModel],_ matchModel:MatchModel,_ success:String?)->()){

        Alamofire.request(manger.requestURLGenerateWithURL(path: manger.kURLStringFirstPage),method:.get).responseJSON { (response) in
            if response.result.isSuccess {
                var newsModelArray = [HomeModel]();
                let dict = response.result.value as! NSDictionary
//                print(dict)
                let leagueDict = dict["league"] as! NSDictionary//赛事
                let news = dict["news"] as! NSDictionary//新闻
                let newsList = news["list"] as! NSArray//新闻数组
                
                let matchModel = JSONDeserializer<MatchModel>.deserializeFrom(dict: leagueDict)
                for newsDict in newsList {
                    let newsModel = JSONDeserializer<HomeModel>.deserializeFrom(dict: newsDict as? NSDictionary)
                    if (newsModel != nil) {
                        newsModelArray.append(newsModel!)
                    }

                }
                finished(newsModelArray,matchModel!,"成功")
                
            }else {
                finished([],MatchModel(),"失败")
            }
            
        
        }
        
    }
    func captureValue(sums amount:Int) -> Int {
        var a = 0
        a += amount
        return a
        
    }

}
