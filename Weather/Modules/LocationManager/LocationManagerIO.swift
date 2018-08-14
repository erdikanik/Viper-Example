//
//  LocationManagerIO.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import INTULocationManager

protocol LocationManagerInput {
    func requestUserCurrentLocation()
}

protocol LocationManagerOutput {
    func userLocationUpdated(with location: CLLocation)
}
