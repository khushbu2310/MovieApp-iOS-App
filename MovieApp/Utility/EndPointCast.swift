//
//  EndPointCast.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

enum EndPointCast {
    case tvShowsCastList(id: Int)
    case moviesCastList(id: Int)
    case personDetailsById(id: Int)
    case personImagesById(id: Int)
    case knownForCombine(id: Int)
    case knownForMovies(id: Int)
    case knownForTvShows(id: Int)
}

extension EndPointCast: EndPointAPIType {
    var methods: String {
        return "GET"
    }

    var path: String {
        switch self {
        case .tvShowsCastList(let id):
            return "tv/\(id)/credits"
        case .moviesCastList(let id):
            return "movie/\(id)/credits"
        case .personDetailsById(let id):
            return "person/\(id)"
        case .personImagesById(let id):
            return "person/\(id)/images"
        case .knownForCombine(let id):
            return "person/\(id)/combined_credits"
        case .knownForMovies(let id):
            return "person/\(id)/movie_credits"
        case .knownForTvShows(let id):
            return "person/\(id)/tv_credits"
        }
    }
    
    var url: String? {
        return "\(Constants.baseURL)\(path)"
    }
    
    var headers: [String: String]? {
        return [ "Content-Type": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .tvShowsCastList(let id), .moviesCastList(let id), .personDetailsById(let id), .personImagesById(let id), .knownForCombine(let id), .knownForMovies(let id), .knownForTvShows(let id):
            return [
                URLQueryItem(name: "api_key", value: Constants.APIKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "id", value: String(id))
            ]
        }
    }
}
