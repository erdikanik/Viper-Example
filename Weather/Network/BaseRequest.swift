//
//  BaseRequest.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Alamofire

class BaseRequest: URLRequestConvertible, ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        return self.urlRequest!
    }
    
    
    private enum Constants {
        static let url = "http://api.openweathermap.org/data/2.5/"
        static let contentType = "application/json"
        static let apiKeyParameter = "APPID"
    }
    
    private enum HeaderField {
        static let authentication = "Authorization"
        static let contentType = "Content-Type"
        static let acceptType = "Accept"
        static let acceptEncoding = "Accept-Encoding"
    }
    
    private enum ContentType {
        static let json = "application/json"
    }
    
    var path = ""
    var parameters: Parameters {
        return [:]
    }
    
    func parametersWithAPIKey() -> Parameters {
         var requestParameters = parameters
         requestParameters[Constants.apiKeyParameter] = Global.Constants.apiKey
         return requestParameters
    }
    
    var httpMethod: HTTPMethod = .get
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.url.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent("weather"))
        
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.setValue(ContentType.json, forHTTPHeaderField: HeaderField.contentType)

        return urlRequest
    }
}
