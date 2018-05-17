//
//  UnitsModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct UnitsModel: Mappable {
    var distance: String?
    var pressure: String?
    var speed: String?
    var temperature: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        distance <- map["distance"]
        pressure <- map["pressure"]
        speed <- map["speed"]
        temperature <- map["temperature"]
    }
    
}
