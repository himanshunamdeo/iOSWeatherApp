//
//  ForecastModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct ForecastModel: Mappable {
    var code: String?
    var date: String?
    var day: String?
    var high: String?
    var low: String?
    var text: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        date <- map["date"]
        day <- map["day"]
        high <- map["high"]
        low <- map["low"]
        text <- map["text"]
    }
}
