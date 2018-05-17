//
//  Utility.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

struct YQL {
    private static let prefix:NSString = "http://query.yahooapis.com/v1/public/yql?&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=&q="
    
    static func query(statement:String) -> RootModel? {
        
        let escapedStatement = statement.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let query = "\(prefix)\(escapedStatement!)"
        
//        var results:NSDictionary? = nil
        var results: RootModel?
        
        var jsonData: NSData?
        
        do {
            jsonData = try NSData(contentsOf: URL(string: query)!, options: NSData.ReadingOptions.dataReadingMapped)
        } catch let exception {
            print(exception)
        }
        
        
        if jsonData != nil {
            
            do {
                let resultDictionary = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                results = RootModel(JSON: resultDictionary!)
            } catch let exception {
                print(exception)
            }
        }
        return results
    }
}
