//
//  MovieRepoMock.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 06/11/23.
//

import Foundation
@testable import MovieApp

class MovieRepoMock: MovieAppRepositoryDelegate {
    
    func getMovieAppData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        switch type {
            
        case EndPointMovie.topRatedMovie:
            guard let data = topRatedMovieMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointMovie.popularMovie:
            guard let data = popularMovieMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointMovie.movieDetails:
            guard let data = movieDetailsMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointMovie.movieVideoDetails:
            guard let data = movieVideoMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointTVShow.popularTVShows:
            guard let data = popularTVShowMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointTVShow.tvShowDetails:
            guard let data = tvShowDetailsMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointTVShow.tvShowVideoDetails:
            guard let data = tvShowVideoMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointCast.castDetailsById:
            guard let data = castDetailsMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointCast.moviesCastList:
            guard let data = castMovieMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointCast.tvShowsCastList:
            guard let data = castTVShowMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
            
        case EndPointCast.knownForCombine:
            guard let data = castCombineMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))

        case EndPointCast.castImagesById:
            guard let data = castImageMockData as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))

        default:
            completion(.failure(.invalidData))
        }
    }

}

