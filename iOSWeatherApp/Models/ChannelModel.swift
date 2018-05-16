//
//  ChannelModel.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import ObjectMapper

struct ChannelModel: Mappable {
    
    var astronomy: AstronomyModel?
    var atmosphere: AtmosphereModel?
    var description: String?
    var image: ImageModel?
    var item: ItemModel?
    var language: String?
    var lastBuildDate: String?
    var link: String?
    var location: LocationModel?
    var title: String?
    var ttl: String?
    var units: UnitsModel?
    var wind: WindModel?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        astronomy <- map["astronomy"]
        atmosphere <- map["atmosphere"]
        description <- map["description"]
        image <- map["image"]
        item <- map["item"]
        language <- map["language"]
        lastBuildDate <- map["lastBuildDate"]
        link <- map["link"]
        title <- map["title"]
        ttl <- map["ttl"]
        units <- map["units"]
        wind <- map["wind"]
        location <- map["location"]
    }
}
