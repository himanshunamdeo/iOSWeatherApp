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

class ViewController: UIViewController {
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
        view.subviews.forEach { (view) in
            if view.isKind(of: WeatherView.self) {
                view.removeFromSuperview()
            }
        }
        let topConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: weatherView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: weatherView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: weatherView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: weatherView, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        
        view.addSubview(weatherView)
        view.addConstraints([topConstraint,bottomConstraint,leadingConstraint,trailingConstraint])
        view.bringSubview(toFront: weatherView)
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
