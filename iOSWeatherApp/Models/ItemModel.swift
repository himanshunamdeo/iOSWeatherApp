//
//  ItemModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct ItemModel: Mappable {
    var condition: ConditionModel?
    var description: String?
    var forecast: [ForecastModel]?
    var lat: String?
    var link: String?
    var long: String?
    var pubDate: String?
    var title: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        condition <- map["condition"]
        description <- map["description"]
        forecast <- map["forecast"]
        lat <- map["lat"]
        link <- map["link"]
        long <- map["long"]
        pubDate <- map["pubDate"]
        title <- map["title"]
        
    }
}
