//
//  WeatherView.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 17/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit

protocol WeatherViewDelegate {
    func searchButtonDidTapped()
}

class WeatherView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var tempratureUnitLabel: UILabel!
    @IBOutlet weak var weatherShortInfoLabel: UILabel!
    @IBOutlet weak var maxMinTempratureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var moisturePercentLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    var forecastArray: [ForecastModel]?
    var delegate: WeatherViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        forecastArray = [ForecastModel]()
    }
    
    override func awakeFromNib() {
        forecastCollectionView.register(UINib(nibName: "FutureForecastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FutureForecastCollectionViewCell")
    }
    
    public static func loadNib(isLandscape: Bool) -> WeatherView {
        
        let view = Bundle.main.loadNibNamed(isLandscape ? "WeatherLandscapeView" : "WeatherPortraitView", owner: self, options: nil)?.first as! UIView
        return view as! WeatherView
    }
    
    public func populateUI(weatherForecastManager: WeatherForecastManager) {
        forecastArray = weatherForecastManager.weatherForcasteData?.forecast
        dayLabel.text = weatherForecastManager.weatherForcasteData?.forecast?.first?.day
        tempratureLabel.text = weatherForecastManager.weatherForcasteData?.condition?.temp
        if let temperatureUnit = weatherForecastManager.unitData?.temperature {
            tempratureUnitLabel.text = "˚\(temperatureUnit)"
            maxMinTempratureLabel.text = "\((weatherForecastManager.weatherForcasteData?.forecast?.first?.low)!)˚\(temperatureUnit)/\((weatherForecastManager.weatherForcasteData?.forecast?.first?.high)!)˚\(temperatureUnit)"
        }
        weatherShortInfoLabel.text = weatherForecastManager.weatherForcasteData?.condition?.text
        cityLabel.text = weatherForecastManager.locationData?.city
        windSpeedLabel.text = "\((weatherForecastManager.currentWind?.speed)!) \((weatherForecastManager.unitData?.speed)!)"
        moisturePercentLabel.text = "\((weatherForecastManager.currentAtmosphereData?.humidity)!)%"
        if let image = UIImage(named: "\((weatherForecastManager.weatherForcasteData?.forecast?.first?.code)!)") {
            weatherIconImageView.image = image
        } else {
            weatherIconImageView.image = UIImage(named: "weather-none-available")
        }
    }
    
    @IBAction func searchButtonAction(sender: Any) {
        if let delegate = delegate {
            delegate.searchButtonDidTapped()
        }
    }
    
    // MARK- Collection view delegate methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FutureForecastCollectionViewCell", for: indexPath)
        let forecast = forecastArray![indexPath.row + 1]
        (cell as? FutureForecastCollectionViewCell)?.populateUI(forecast: forecast)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (forecastArray?.count)! > 0 ? (forecastArray?.count)! - 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? CGSize(width: 180, height: 180) : CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}
