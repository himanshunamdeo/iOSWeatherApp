//
//  ResultsModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResultsModel: Mappable {
    
    var channel: ChannelModel?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        channel <- map["channel"]
    }
}
