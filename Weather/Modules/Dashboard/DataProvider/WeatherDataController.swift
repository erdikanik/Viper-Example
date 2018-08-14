//
//  WeatherDataController.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Alamofire

final class WeatherDataController: WeatherDataProviderInterface {
    func weatherDataWithLocation(longitude: String?, latitude: String?, completion: @escaping (Weather?, Error?)->Void) {
        let locationWeatherRequest = LocationWeatherRequest()
        locationWeatherRequest.latitude = latitude ?? ""
        locationWeatherRequest.longitude = longitude ?? ""
        NetworkManager.performRequest(request: locationWeatherRequest) { (result: Result<Weather>) in
           completion(result.value, result.error)
        }
    }
}
