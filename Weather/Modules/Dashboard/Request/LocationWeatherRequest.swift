//
//  LocationWeatherRequest.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import Alamofire

final class LocationWeatherRequest: BaseRequest {

    private enum Mapping {
        static let longtitude = "lon"
        static let latitude = "lat"
    }
    
    var longitude = ""
    var latitude = ""
   
    override var parameters: Parameters {
        return [Mapping.longtitude: longitude as Any, Mapping.latitude: latitude as Any]
    }
}
