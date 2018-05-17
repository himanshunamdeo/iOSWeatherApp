//
//  ViewController.swift
//  iOSWeatherApp
//
//  Created by Himanshu Namdeo on 16/05/18.
//  Copyright © 2018 Himanshu. All rights reserved.
//

import UIKit
import GooglePlaces

typealias ForecastFailedWithMessage = ( _ errorMessage: String? ) -> ()

class ViewController: UIViewController, GMSAutocompleteViewControllerDelegate, WeatherViewDelegate {
    
    
    var weatherForecastManager: WeatherForecastManager?
    
    override func viewDidLoad() {
        
        weatherForecastManager = WeatherForecastManager()
        weatherForecastManager?.getWeatherForeCastForCurrentPlace(forecastFailedWithMessage: { (failedMessage) in
            if let failedMessage = failedMessage {
                self.showAlert(title: "", message: failedMessage)
                return
            }
            self.populateUI()
        })
    }
    
    func populateUI() {
        checkForOrientation()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        checkForOrientation()
    }
    
    func checkForOrientation() {
        let weatherView: WeatherView = WeatherView.loadNib(isLandscape: UIDevice.current.orientation.isLandscape)
        weatherView.delegate = self
        view.subviews.forEach { (view) in
            if view.isKind(of: WeatherView.self) {
                view.removeFromSuperview()
            }
        }
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weatherView)
        view.bringSubview(toFront: weatherView)
        let topConstraint = NSLayoutConstraint(item: weatherView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: weatherView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: weatherView, attribute: NSLayoutAttribute.leadingMargin, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: weatherView, attribute: NSLayoutAttribute.trailingMargin, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        view.addConstraints([topConstraint, bottomConstraint,leadingConstraint,trailingConstraint])
        NSLayoutConstraint.activate([topConstraint, bottomConstraint,leadingConstraint,trailingConstraint])
        weatherView.populateUI(weatherForecastManager: weatherForecastManager!)
    }
    
    
    
    // MARK - GMS Autocomplete view controller delegate methods
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        var placeInfo : PlaceInfoTuple = ("","")
        for addressComponent in place.addressComponents! {
            if addressComponent.type == "administrative_area_level_1" { //state
                placeInfo.state = addressComponent.name
            }
            if addressComponent.type == "administrative_area_level_2" { //city
                placeInfo.city = addressComponent.name
            }
        }
        viewController.dismiss(animated: true, completion: nil)
        weatherForecastManager?.getForecastWithYQLQuery(placeInfo: placeInfo)
        populateUI()
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    // MARK - Weather View delegate methods
    func searchButtonDidTapped() {
        let autocompleteViewController = GMSAutocompleteViewController()
        autocompleteViewController.delegate = self
        present(autocompleteViewController, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
