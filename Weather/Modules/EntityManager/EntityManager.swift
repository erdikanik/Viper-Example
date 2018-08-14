//
//  EntityManager.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EntityManager {
    
    private enum Constants {
        static let entityName = "WeatherModel"
    }
    
    static func saveWeatherData(weather: Weather, date: String) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            
            _ = WeatherModel.weatherModelFromWeatherNetworkObject(weather: weather,
                                                                  date: date, managedContext: managedContext)
            do {
                try managedContext.save()
            } catch let error as NSError {
                fatalError(error.description)
            }
            
            managedContext.refreshAllObjects()
        }
    }
    
    static func weatherDatas() -> [WeatherModel]? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entityName)
            let predicate = NSPredicate(value: true)
            fetchRequest.predicate = predicate
            
            do {
                let result = try managedContext.fetch(fetchRequest)
                return result as? [WeatherModel]
            } catch let error as NSError {
                fatalError(error.description)
            }
        }
        
        return nil
    }
}
