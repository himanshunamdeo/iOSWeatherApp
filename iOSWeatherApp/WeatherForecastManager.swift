//
//  WeatherForecastManager.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import Foundation
import GooglePlaces

typealias PlaceInfoTuple = (city: String, state: String)

class WeatherForecastManager {
    
    
    var currentWind: WindModel?
    var currentAtmosphereData: AtmosphereModel?
    var astronomyPredictionData: AstronomyModel?
    var weatherForcasteData: ItemModel?
    var locationData: LocationModel?
    var unitData: UnitsModel?
    
    init() {
         
    }

    public func getWeatherForeCastForCurrentPlace(forecastFailedWithMessage: @escaping ForecastFailedWithMessage) {
        
        GMSPlacesClient.shared().currentPlace { (placeLiklyHoodList, error) in
            if let error = error {
                forecastFailedWithMessage(error.localizedDescription)
                return
            }
            
            let placeInfo = self.getCityAndStateFromLikelyHoodList(placeLiklyHoodList: placeLiklyHoodList)
            self.getForecastWithYQLQuery(placeInfo: placeInfo)
            forecastFailedWithMessage(nil)
        }
    }
    
    public func getForecastWithYQLQuery(placeInfo: PlaceInfoTuple) {
        let forecast = YQL.query(statement: self.getQueryForWeatherForecastIn(city: placeInfo.city, state: placeInfo.state))
        self.currentWind = forecast?.query?.results?.channel?.wind
        self.currentAtmosphereData = forecast?.query?.results?.channel?.atmosphere
        self.astronomyPredictionData = forecast?.query?.results?.channel?.astronomy
        self.weatherForcasteData = forecast?.query?.results?.channel?.item
        self.locationData = forecast?.query?.results?.channel?.location
        self.unitData = forecast?.query?.results?.channel?.units
    }
    
    private func getCityAndStateFromLikelyHoodList(placeLiklyHoodList: GMSPlaceLikelihoodList?) -> PlaceInfoTuple {
        var placeInfo : PlaceInfoTuple = ("","")
        
        if let placeList = placeLiklyHoodList {
            if let place = placeList.likelihoods.first?.place {
                
                for addressComponent in place.addressComponents! {
                    
                    if addressComponent.type == "administrative_area_level_1" { //state
                        placeInfo.state = addressComponent.name
                    }
                    if addressComponent.type == "administrative_area_level_2" { //city
                        placeInfo.city = addressComponent.name
                    }
                    
                }
            }
        }
        return placeInfo
    }
    
    private func getQueryStringForWOEID(city: String, state: String) -> String {
        let string = "select woeid from geo.places(1) where text=\"\(city), \(state)\""
        return string
    }
    
    private func getQueryForWeatherForecastIn(city: String, state: String) -> String {
        let string = "select * from weather.forecast where woeid in (\(getQueryStringForWOEID(city:city, state:state)))"
        return string
    }
    
}
