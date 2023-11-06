//
//  CastRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

protocol CastRepositoryDelegate: AnyObject {
    func getCastData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>)
}

class CastRepository: CastRepositoryDelegate {
    func getCastData<T>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) where T: Decodable, T: Encodable {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
