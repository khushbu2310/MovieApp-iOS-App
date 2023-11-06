//
//  TVRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

protocol TVShowRepositoryDelegate: AnyObject {
    func getTVShowData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>)
}

class TVShowRepository: TVShowRepositoryDelegate {
    func getTVShowData<T>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) where T: Decodable, T: Encodable {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
