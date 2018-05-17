//
//  QueryModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct QueryModel: Mappable {
    var count: NSNumber?
    var created: String?
    var language: String?
    var results: ResultsModel?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        count <- map["count"]
        created <- map["created"]
        language <- map["lang"]
        results <- map["results"]
    }
}
