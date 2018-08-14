//
//  WeatherModel.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import CoreData

extension WeatherModel {

    /// Creates weather model to store db
    ///
    /// - Parameters:
    ///   - weather: weather model
    ///   - date: date as String
    ///   - managedContext: managed context
    /// - Returns: weather model object
    static func weatherModelFromWeatherNetworkObject(weather: Weather,
                                                     date: String,
                                                     managedContext: NSManagedObjectContext) -> WeatherModel {
        let weatherModel = WeatherModel(context: managedContext)
        
        weatherModel.name = weather.name
        weatherModel.country = weather.sys.country
        weatherModel.temperature = weather.main.temp
        weatherModel.humidity = Int64( weather.main.humidity)
        weatherModel.pressure = Int64(weather.main.pressure)
        weatherModel.windSpeed = Double(weather.wind.speed)
        weatherModel.mainDescription = weather.weather.first?.main
        weatherModel.iconId = weather.weather.first?.icon
        weatherModel.date = date
        return weatherModel
    }
}
