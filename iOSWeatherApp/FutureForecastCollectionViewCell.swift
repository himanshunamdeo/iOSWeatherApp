//
//  FutureForecastCollectionViewCell.swift
//  iOSWeatherApp
//
//  Created by Himanshu on 17/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

let CARD_VIEW_CORNER_RADIUS = CGFloat(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 10.0 : 5.0)

class FutureForecastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        cardView.layer.cornerRadius = CARD_VIEW_CORNER_RADIUS
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowRadius = 3.0
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    public func populateUI(forecast: ForecastModel) {
        if let image = UIImage(named: forecast.code!) {
            weatherIconImageView.image = image
        } else {
            weatherIconImageView.image = UIImage(named: "weather-none-available")
        }
        tempratureLabel.text = "\((forecast.high)!)˚/ \((forecast.low)!)˚"
        let dateNumeral = forecast.date?.getDateComponentsFromString()["day"]
        dayLabel.text = "\((forecast.day)!) \(dateNumeral!)"
    }
}
