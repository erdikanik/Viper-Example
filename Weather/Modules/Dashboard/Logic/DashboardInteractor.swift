//
//  DashboardInteractor.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import MapKit

final class DashboardInteractor: DashboardInteractorInput {
    
    private enum Constant{
        static let dateFormat = "MMM d, h:mm a"
    }
    
    var dataProvider: WeatherDataProviderInterface!
    var locationManagerInterface: LocationManagerInput!
    var interactorOutput: DashboardInteractorOutput!
    var currentWeather: Weather?
    var date: String?
    
    func updateInitialWeatherData() {
        locationManagerInterface.requestUserCurrentLocation()
    }
    
    private func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: Date())
    }
    
    func saveCurrentInitialWeatherData() {
        guard let weather = currentWeather, let date = date else {
            return
        }
        EntityManager.saveWeatherData(weather: weather, date: date)
        if let displayItems = storedWeatherModels() {
            interactorOutput.storedDataFetched(with: displayItems)
        }
    }
    
    private func storedWeatherModels() -> [WeatherDisplayItem]? {
        return EntityManager.weatherDatas()?.map({ (weatherModel) -> WeatherDisplayItem in
            return WeatherDisplayItem(with: weatherModel)
        })
    }
}

extension DashboardInteractor: LocationManagerOutput {
    func userLocationUpdated(with location: CLLocation) {
        
        let longitude = String(format: "%.2f", location.coordinate.longitude)
        let latitude = String(format: "%.2f", location.coordinate.latitude)
        
        dataProvider.weatherDataWithLocation(longitude: longitude, latitude: latitude, completion: { [weak self] (weather, error) in
            if error == nil, let weather = weather {
                self?.currentWeather  = weather
                self?.date = self?.currentDate()
                self?.interactorOutput.weatherDataFetchedFromNetwork(with: WeatherDisplayItem(with: weather, date: self?.date ?? ""))
                
                if let displayItems = self?.storedWeatherModels() {
                    self?.interactorOutput.storedDataFetched(with: displayItems)
                }
            }
        })
    }
}
