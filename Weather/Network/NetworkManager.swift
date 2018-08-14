//
//  NetworkManager.swift
//  Weather
//
//  Created by Erdi on 7.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

import Alamofire

final class NetworkManager {
    @discardableResult
    static func performRequest<T: Decodable>(request: BaseRequest, completion:@escaping (Result<T>)->Void) -> DataRequest? {
        do {
            let finalRequest = try Alamofire.URLEncoding().encode(request, with: request.parametersWithAPIKey())
            return Alamofire.request(finalRequest).responseJSONDecodable { (response: DataResponse<T>) in
                completion(response.result)
            }
        } catch {
            return nil
        }
    }    
}
