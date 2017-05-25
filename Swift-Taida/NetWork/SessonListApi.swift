//
//  SessonListApi.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/22.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class SessonListApi: NSObject {
    var manger = URLManger()
    let topicModel = SessionTopTopicModel()
    let topicModel2 = SessionTopicModel()

    var homeArray = [HomeModel]()
    
    override init() {
        
        super.init()
    }
    
    public func getSessionList(pageNumber:Int,finished:@escaping (_ topArray:[SessionTopTopicModel],_ seeionListArray:[SessionTopicModel],_ success:String?)->()){
        Alamofire.request(manger.requestSessionURL(path: ""), method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let dict = response.result.value as! NSDictionary
                let responseDataDict = dict["data"] as! NSDictionary
                //topTopics
                let topTopicsDict = responseDataDict["topTopics"] as! NSDictionary
                let topTopicsArray = topTopicsDict["data"] as! NSArray
                var topMutableArray = [SessionTopTopicModel]();
                if topTopicsArray.count > 5 {
                 let array = topTopicsArray.subarray(with: NSRange.init(location: 0, length: 5)) as NSArray
                    for topicDict in array {
                        let topTopicMolde = JSONDeserializer<SessionTopTopicModel>.deserializeFrom(dict: topicDict as? NSDictionary)
                        if (topTopicMolde != nil) {
                            topMutableArray.append(topTopicMolde!)
                        }

                    }
                } else {
                    
                    for topicDict in topTopicsArray {
                        let topTopicMolde = JSONDeserializer<SessionTopTopicModel>.deserializeFrom(dict: topicDict as? NSDictionary)
                        if (topTopicMolde != nil) {
                            topMutableArray.append(topTopicMolde!)
                        }
                        
                    }

                }
                
                //topics
                let topicsDict = responseDataDict["topics"] as! NSDictionary
                let topicsArray = topicsDict["data"] as! NSArray
                var topicsMutableArray = [SessionTopicModel]();

                for topicDict in topicsArray {
                    let topTopicMolde = JSONDeserializer<SessionTopicModel>.deserializeFrom(dict: topicDict as? NSDictionary)
                    if (topTopicMolde != nil) {
                        topicsMutableArray.append(topTopicMolde!)
                    }
                    
                }
//                print(topicsArray);
                finished(topMutableArray,topicsMutableArray,"1")

            }else{
                finished([],[],"0")
                
            }
            
            
        }
    }
    
    func getMoreSessionList(model:SessionTopicModel,finished:@escaping(_ sessionListArray:[SessionTopicModel],_ success:String)->()) {
        Alamofire.request(manger.requestSessionURL(path: "") + "/topics", method: .get, parameters: ["method":"history","timestamp":model.timestamp!]).responseJSON { (response) in
            if response.result.isSuccess {
                let responseDict = response.result.value as! NSDictionary
//                print(responseDict)
                let responseData = responseDict["data"] as! NSDictionary
                let responseArray = responseData["data"] as! NSArray
                var sessionListArray = [SessionTopicModel]()
                for sessionDict in responseArray {
                    let topTopicMolde = JSONDeserializer<SessionTopicModel>.deserializeFrom(dict: sessionDict as? NSDictionary)
                    if (topTopicMolde != nil) {
                        sessionListArray.append(topTopicMolde! )
                    }
                }
                finished(sessionListArray,"success")
            }else{
                finished([],"filed")
            }
        }
    }

}
