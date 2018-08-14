//
//  UIImageExtensions.swift
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import UIKit

extension UIImageView {
    public func image(with urlString: String) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data, response, error) in
            OperationQueue.main.addOperation {
                if let data = data {
                    self.image = UIImage(data: data)
                }
            }
        }
        
        session.resume()
    }
}
