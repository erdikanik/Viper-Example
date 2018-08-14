//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import XCTest
import MapKit
@testable import Weather

class WeatherTests: XCTestCase {
    
    class WeatherDataController: WeatherDataProviderInterface {
        func weatherDataWithLocation(longitude: String?, latitude: String?, completion: @escaping (Weather?, Error?) -> Void) {
            
            let coordinate = Coordinate(lon: 24.1, lat: 56.94)
            let state = State(id: 800, main: "Clear", description: "", icon: "01d")
            let main = Main(temp: 281.15, pressure: 1028, humidity: 33, temp_min: 281.15, temp_max: 281.15)
            let wind = Wind(speed: 2.1)
            let country = Country(type: 1, id: 7368, message: 0.0035, country: "LV", sunrise: 1523072171, sunset: 1523121384)
            let weather = Weather(name: "Vecrīga", wind: wind, coord: coordinate, weather: [state], main: main, sys: country)
            
            completion(weather, nil)
        }
    }
    
    class InteractorOutputClass: DashboardInteractorOutput {
        var interactorInput: DashboardInteractorInput!
        
        func startToFetchData() {
            interactorInput.updateInitialWeatherData()
        }
        
        func saveButtonTapped() {
            interactorInput.saveCurrentInitialWeatherData()
        }
        
        func weatherDataFetchedFromNetwork(with displayItem: WeatherDisplayItem) {
            XCTAssert(displayItem.country == "LV")
            XCTAssert(displayItem.icon == "01d")
            XCTAssert(displayItem.humidity == "33")
        }
        
        func storedDataFetched(with displayItems: [WeatherDisplayItem]) {
            let displayItem = displayItems.last
            
            XCTAssert(displayItem!.country == "LV")
            XCTAssert(displayItem!.icon == "01d")
            XCTAssert(displayItem!.humidity == "33")
        }
    }
    
    class LocationManager: LocationManagerInput {
        var locationManagerOutput: LocationManagerOutput?
        func requestUserCurrentLocation() {
            locationManagerOutput?.userLocationUpdated(with: CLLocation(latitude: 10, longitude: 10))
        }
    }
    
    func testDashboardInteractor() {
        let interactor = DashboardInteractor()
        let interactorOutputClass = InteractorOutputClass()
        interactorOutputClass.interactorInput = interactor
        interactor.interactorOutput = interactorOutputClass
        interactor.dataProvider  = WeatherDataController()
        
        let locationManager = LocationManager()
        locationManager.locationManagerOutput = interactor
        interactor.locationManagerInterface = locationManager
        
        interactorOutputClass.startToFetchData()
        interactorOutputClass.saveButtonTapped()
    }
}
