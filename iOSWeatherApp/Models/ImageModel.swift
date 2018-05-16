//
//  ImageModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImageModel: Mappable {
    var height: String?
    var link: String?
    var title: String?
    var url: String?
    var width: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        height <- map["height"]
        link <- map["link"]
        title <- map["title"]
        url <- map["url"]
        width <- map["width"]
    }
}
