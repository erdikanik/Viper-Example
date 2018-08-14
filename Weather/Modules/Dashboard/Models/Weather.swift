//
//  Weather.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let name: String
    let wind: Wind
    let coord: Coordinate
    let weather: [State]
    let main: Main
    let sys: Country
}
