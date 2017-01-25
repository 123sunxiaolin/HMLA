//
//  HealthClassifyModel.swift
//  HMLA
//
//  Created by Sunxiaolin on 17/1/25.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

import UIKit
import ObjectMapper

class HealthClassifyModel: Mappable {

    var id: Int?
    var seq: Int?
    var name: String?
    var keywords: String?
    var title: String?
    var description: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        
        id             <- map["id"]
        seq            <- map["seq"]
        name           <- map["name"]
        keywords       <- map["keywords"]
        title          <- map["title"]
        description    <- map["description"]
    }
    
}

class HealthModelArray: Mappable{
    var status: Bool?
    var tngou: [HealthClassifyModel]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        status         <- map["status"]
        tngou         <- map["tngou"]
    }
}


class RequestClassify: Mappable{
    
    init(){
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
    }
    
    class func path()-> String{
        return "http://www.tngou.net/api/info/classify"
    }
    
}
