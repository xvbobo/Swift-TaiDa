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
    var homeArray = Array<Any>()
    let addCloser:() ->(Any) = {
        return
    }
    var closer:((Any) -> ())?
    override init() {
    super.init()
   }
    
    public func getHomeData() -> Array<Any>{
        weak var weakself = self

        Alamofire.request(manger.requestURLGenerateWithURL(path: manger.kURLStringFirstPage),method:.get).responseJSON { (response) in
//            let dict1 = response.result.value as! NSDictionary
//            let model = JSONDeserializer<HomeModel>.deserializeFrom(dict: dict1.object(forKey: "league") as! NSDictionary?)
//            if self.closer != nil {
//                self.closer!(model ?? default value)
//            }
            weakself?.homeArray.append(self.homoModel);
        }
        return homeArray;
        
    }

}
