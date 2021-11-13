//
//  HandleResponseMethod.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import Foundation
import Moya

func handleResponse<ModelType: Decodable>(
    result: Result<Response, MoyaError>,
    setupJsonDecoder: ((JSONDecoder) -> Void)? = nil,
    completion: ((_ model: ModelType?, _ error: Error?) -> Void)
) {
    switch result {
    case let .success(moyaResponse):
        let data = moyaResponse.data
        let statusCode = moyaResponse.statusCode
        if statusCode >= 200 && statusCode <= 299 {
            var model: ModelType? = nil
            do {
                let decoder = JSONDecoder()
                setupJsonDecoder?(decoder)
                model = try decoder.decode(ModelType.self, from: data)
            } catch {
                print("JSON decode error: \(error).")
            }
            let error = try? JSONDecoder().decode(Error.self, from: data)
            completion(model, error?.message == nil ? nil : error)
        } else {
            var errorModel = Error()
            do {
                errorModel = try JSONDecoder().decode(Error.self, from: data)
            } catch {
                print("JSON decode error: \(error).")
            }
            completion(nil, errorModel)
        }
    case let .failure(error):
        let errorModel = Error(message: error.localizedDescription, code: error.errorCode)
        completion(nil, errorModel)
    }
    
}
