//
//  MovieAppRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 07/11/23.
//

import Foundation

protocol MovieAppRepositoryDelegate: AnyObject {
    func getMovieAppData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>)
}

class MovieAppRepository: MovieAppRepositoryDelegate {
    func getMovieAppData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
