//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

protocol MovieRepositoryDelegate: AnyObject {
    func getMovieData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>)
}

class MovieRepository: MovieRepositoryDelegate {
    func getMovieData<T>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) where T: Decodable, T: Encodable {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
