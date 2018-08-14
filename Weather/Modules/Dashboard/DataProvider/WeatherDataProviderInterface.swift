//
//  WeatherDataProviderInterface.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

protocol WeatherDataProviderInterface {
    func weatherDataWithLocation(longitude: String?, latitude: String?, completion: @escaping (Weather?, Error?)->Void)
}
