//
//  EndPointMovie.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

enum EndPointMovie {
    case popularMovie
    case topRatedMovie
    case upcomingMovie
    case nowPlayingMovie
    case movieDetails(id: Int)
    case movieVideoDetails(id: Int)
}

extension EndPointMovie: EndPointAPIType {
    var methods: String {
        return "GET"
    }
    
    var path: String {
        switch self {
        case .popularMovie:
            return "movie/popular"
        case .topRatedMovie:
            return "movie/top_rated"
        case .upcomingMovie:
            return "movie/upcoming"
        case .nowPlayingMovie:
            return "movie/now_playing"
        case .movieDetails(let id):
            return "movie/\(id)"
        case .movieVideoDetails(let id):
            return "movie/\(id)/videos"
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
        case .movieDetails, .movieVideoDetails:
            return [
                URLQueryItem(name: "api_key", value: Constants.APIKey),
                URLQueryItem(name: "language", value: "en-US")
            ]
        case .popularMovie, .topRatedMovie, .nowPlayingMovie, .upcomingMovie:
            return [
                URLQueryItem(name: "api_key", value: Constants.APIKey),
                URLQueryItem(name: "language", value: "en-US")
            ]
        }
    }
}
