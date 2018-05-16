//
//  ConditionModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct ConditionModel: Mappable {
    var code: String?
    var date: String?
    var temp: String?
    var text: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        date <- map["date"]
        temp <- map["temp"]
        text <- map["text"]
    }
}
