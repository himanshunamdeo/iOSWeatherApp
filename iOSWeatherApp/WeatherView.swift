//
//  WeatherView.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 17/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var tempratureUnitLabel: UILabel!
    @IBOutlet weak var weatherShortInfoLabel: UILabel!
    @IBOutlet weak var maxMinTempratureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var moisturePercentLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    public static func loadNib(isLandscape: Bool) -> WeatherView {
        let view = Bundle.main.loadNibNamed(isLandscape ? "WeatherLandscapeView" : "WeatherPortraitView", owner: self, options: nil)?.first as! UIView
        return view as! WeatherView
    }
}
