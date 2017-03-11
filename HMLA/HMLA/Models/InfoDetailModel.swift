//
//  InfoDetailModel.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/25.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit
import ObjectMapper

class InfoDetailModel: Mappable {

    var id: Int?
    var count: Int?//访问次数
    var rcount: Int?//评论读数
    var fcount: Int?//收藏数
    var infoClass: Int?//分类
    var img: String?//图片
    var time: String?
    var keywords: String? //关键字
    var title: String?//资讯标题
    var message: String?//资讯内容
    var description: String? //描述
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        count               <- map["count"]
        rcount              <- map["rcount"]
        fcount              <- map["fcount"]
        infoClass           <- map["infoClass"]
        img                 <- map["img"]
        time                <- map["time"]
        keywords            <- map["keywords"]
        title               <- map["title"]
        message             <- map["message"]
        description         <- map["description"]
        
        img = String("http://tnfs.tngou.net/image" + img! + "_80x120")
    }

}


class RequestInfoDetail: Mappable{
    
    var id: Int?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
    }
    
    func path() ->String{
        return "http://www.tngou.net/api/info/show"
    }
}




