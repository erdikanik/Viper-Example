//
//  WeatherDashboardPresenter.swift
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import UIKit
import Toaster

final class WeatherDashboardPresenter: WeatherDashboardPresenterInput {
    
    var dashboardInteractor: DashboardInteractorInput?
    var dashboardPresenterOutput: WeatherDashboardPresenterOutput?
    var weatherDashboardWireframe: WeatherDashboardWireFrame?
    
    func saveCurrentWeather() {
        let toast = Toast(text: "Saved")
        toast.show()
        dashboardInteractor?.saveCurrentInitialWeatherData()
    }
    
    func updateInitialData() {
        dashboardInteractor?.updateInitialWeatherData()
    }
    
    func pushWeatherDetailView(with weatherDisplayItem: WeatherDisplayItem) {
        weatherDashboardWireframe?.showDetailView(with: weatherDisplayItem)
    }
    
    func getImageWithDisplayItem(with displayItem: WeatherDisplayItem, imageView: UIImageView) {
        imageView.image(with: Global.Constants.imageUrl + displayItem.icon + Global.Constants.pngExtension)
    }
}

extension WeatherDashboardPresenter: DashboardInteractorOutput {
    func weatherDataFetchedFromNetwork(with displayItem: WeatherDisplayItem) {
        dashboardPresenterOutput?.initialDataUpdated(with: displayItem)
    }
    
    func storedDataFetched(with displayItems: [WeatherDisplayItem]) {
        dashboardPresenterOutput?.storedWeatherListUpdated(with: displayItems)
    }
}
