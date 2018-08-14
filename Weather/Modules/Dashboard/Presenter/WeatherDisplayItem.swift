//
//  WeatherDisplayItem.swift
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import UIKit

@objc final class WeatherDisplayItem: NSObject {
    
    var name: String
    var country: String
    var temperature: String
    var humidity: String
    var pressure: String
    var windSpeed: String
    var mainDescription: String
    var icon: String
    var dateDescription: String
    
    init(with weather: Weather, date: String) {
        name = weather.name
        country = weather.sys.country
        temperature = String(format:"%.2f", weather.main.temp)
        humidity = String(weather.main.humidity)
        pressure = String(weather.main.pressure)
        windSpeed = String(format:"%.2f", weather.wind.speed)
        mainDescription = weather.weather.first?.main ?? ""
        icon = weather.weather.first?.icon ?? ""
        dateDescription = date
    }
    
    init(with weatherModel: WeatherModel) {
        name = weatherModel.name ?? ""
        country = weatherModel.country ?? ""
        temperature = String(format:"%.2f", weatherModel.temperature)
        humidity = String(weatherModel.humidity)
        pressure = String(weatherModel.pressure)
        windSpeed = String(format:"%.2f", weatherModel.windSpeed)
        mainDescription = weatherModel.description
        icon = weatherModel.iconId ?? ""
        dateDescription = weatherModel.date ?? ""
    }
    
    func mainDisplayData() -> String {
        return "Name: " + name +
        "\nTemperature: " + temperature +
        "\nDate: " + dateDescription
    }
    
    func cellDisplayData() -> String {
        return name + " " + dateDescription
    }
    
    @objc func detailDisplayData() -> String {
        return "Name: " + name +
            "\nCountry: " + country +
            "\nTemperature: " + temperature +
            "\nHumidity: " + humidity +
            "\nPressure: " + pressure +
            "\nDate: " + dateDescription
    }
}
