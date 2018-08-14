//
//  WeatherDashboardPresenterIO.swift
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation

protocol WeatherDashboardPresenterInput {
    func updateInitialData()
    func saveCurrentWeather()
    func pushWeatherDetailView(with weatherDisplayItem: WeatherDisplayItem)
    func getImageWithDisplayItem(with displayItem: WeatherDisplayItem, imageView: UIImageView)
}

protocol WeatherDashboardPresenterOutput {
    func initialDataUpdated(with weatherDisplayItem: WeatherDisplayItem)
    func storedWeatherListUpdated(with weatherDisplayItemList: [WeatherDisplayItem])
}
