//
//  WeatherDashboardViewController.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Foundation
import UIKit

final class WeatherDashboardViewController: UIViewController {
    
    var presenter: WeatherDashboardPresenterInput?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var displayItems: [WeatherDisplayItem]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.updateInitialData()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        presenter?.saveCurrentWeather()
    }
}

// MARK: - WeatherDashboardPresenterOutput
extension WeatherDashboardViewController: WeatherDashboardPresenterOutput {
    func initialDataUpdated(with weatherDisplayItem: WeatherDisplayItem) {
        descriptionLabel.text = weatherDisplayItem.mainDisplayData()
        presenter?.getImageWithDisplayItem(with: weatherDisplayItem, imageView: imageView)
    }
    
    func storedWeatherListUpdated(with weatherDisplayItemList: [WeatherDisplayItem]) {
        displayItems = weatherDisplayItemList
        weatherTableView.reloadData()
    }
}


extension WeatherDashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell.accessoryType = .disclosureIndicator
        
        if let displayItems = displayItems {
            cell.textLabel?.text = displayItems[indexPath.row].cellDisplayData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayItems?.count ?? 0
    }
}

extension WeatherDashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let displayItems = displayItems {
            presenter?.pushWeatherDetailView(with: displayItems[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
