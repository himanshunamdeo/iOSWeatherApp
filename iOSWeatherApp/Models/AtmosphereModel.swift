//
//  AtmosphereModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct AtmosphereModel: Mappable {
    var humidity: String?
    var pressure: String?
    var rising: String?
    var visibility: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        humidity <- map["humidity"]
        pressure <- map["pressure"]
        rising <- map["rising"]
        visibility <- map["visibility"]
    }
}
