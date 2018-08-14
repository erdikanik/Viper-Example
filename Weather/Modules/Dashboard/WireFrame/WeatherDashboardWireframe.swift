//
//  WeatherDashboardWireframe.swift
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import UIKit

final class WeatherDashboardWireFrame {
    
    private enum Constant {
        
        static let storyboardId = "Main"
    }
    
    weak var presentedViewController: UIViewController?
    
    func showDetailView(with weatherDisplayItem: WeatherDisplayItem) {
        let storyboard = UIStoryboard(name: Constant.storyboardId, bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: String(describing: WeatherDetailViewController.self)) as? WeatherDetailViewController else {
                return
        }
        
        let presenter = WeatherDetailPresenter(displayItem: weatherDisplayItem)
        presenter?.weatherDetailPresenterOutput = viewController
        viewController.presenter = presenter
        presentedViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
