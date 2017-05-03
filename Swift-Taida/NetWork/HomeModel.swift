//
//  HomeModel.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/27.
//  Copyright © 2016年 许菠菠. All rights reserved.
//
//createTime = 1486631170000;
//date = 2;
//dayOfWeek = 0;
//guestScore = 0;
//guestTeamHistoryId = 560;
//guestTeamId = 12;
//guestTeamLogo = "http://img.zhongchao.9hgame.com/uploads/logo_guoan/lifan201720170209170525.png";
//guestTeamName = "\U91cd\U5e86\U5f53\U4ee3\U529b\U5e06";
//homeTeamHistoryId = 563;
//homeTeamId = 13;
//homeTeamLogo = "http://img.zhongchao.9hgame.com/uploads/logo_guoan/taida20170208150841.png";
//homeTeamName = "\U5929\U6d25\U4ebf\U5229";
//hours = 19;
//id = 1762;
//leagueCourt = "\U5929\U6d25\U5965\U6797\U5339\U514b\U4e2d\U5fc3\U4f53\U80b2\U573a";
//leagueStateId = 1;
//leagueStateName = "\U672a\U5f00\U59cb";
//leagueTime = 1491132900000;
//leagueTypeId = 1;
//leagueTypeId2 = 6;
//leagueTypeName = "\U4e2d\U8d85\U8054\U8d5b";
//leagueTypeName2 = "";
//lineupLogo = "";
//masterScore = 0;
//minutes = 35;
//month = 4;
//result = "\U5e73";
//roundsId = 3;
//roundsName = "\U7b2c3\U8f6e";
//seconds = 0;
//time = "2017-04-02 19:35:00";
//updateTime = 1486631170000;
//years = 2017;
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
