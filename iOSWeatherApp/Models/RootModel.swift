//
//  RootModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct RootModel: Mappable {
    var query: QueryModel?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        query <- map["query"]
    }
}
