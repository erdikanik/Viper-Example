//
//  LocationManager.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import INTULocationManager

final class LocationManager: LocationManagerInput {
    
    var locationOutput: LocationManagerOutput!
    
    private enum Constant {
        static let timeOut: TimeInterval = 10
    }
    
    func requestUserCurrentLocation() {
        let locationManager = INTULocationManager.sharedInstance()
    
        locationManager.requestLocation(withDesiredAccuracy: .city,
                                        timeout: Constant.timeOut) { [weak self] (location, accuracy, locationStatus) in
            if let location = location {
                self?.locationOutput.userLocationUpdated(with: location)
            }
        }
    }
}
