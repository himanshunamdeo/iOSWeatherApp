//
//  StringExtention.swift
//  iOSWeatherApp
//
//  Created by Himanshu on 17/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation

extension String {
    func getDateComponentsFromString() -> [String: String] {
        var dateComponents = [String: String]()
        let calender = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let date = formatter.date(from: self)
        let components = calender.dateComponents([Calendar.Component.day,Calendar.Component.month,Calendar.Component.year], from: date!)
        dateComponents["day"] = "\((components.day)!)"
        dateComponents["month"] = "\((components.month)!)"
        dateComponents["year"] = "\((components.year)!)"
        return dateComponents
    }
}
