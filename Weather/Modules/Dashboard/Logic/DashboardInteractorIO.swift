//
//  DashboardInteractorIO.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

protocol DashboardInteractorInput {
    func updateInitialWeatherData()
    func saveCurrentInitialWeatherData()
}

protocol DashboardInteractorOutput {
    func weatherDataFetchedFromNetwork(with displayItem: WeatherDisplayItem)
    func storedDataFetched(with displayItems: [WeatherDisplayItem])
}
