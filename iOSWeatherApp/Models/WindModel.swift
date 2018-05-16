//
//  WindModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct WindModel: Mappable {
    var chill: String?
    var direction: String?
    var speed: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        chill <- map["chill"]
        direction <- map["direction"]
        speed <- map["speed"]
    }
}
