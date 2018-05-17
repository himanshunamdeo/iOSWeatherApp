//
//  LocationModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct LocationModel: Mappable {
    var city: String?
    var country: String?
    var region: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        city <- map["city"]
        country <- map["country"]
        region <- map["region"]
    }
}
