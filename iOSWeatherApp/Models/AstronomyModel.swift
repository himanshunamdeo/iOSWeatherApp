//
//  AstronomyModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct AstronomyModel: Mappable {
    var sunrise: String?
    var sunset: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
