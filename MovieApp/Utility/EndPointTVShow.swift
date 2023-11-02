//
//  EndPointTVShow.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

enum EndPointTVShow {
    case popularTVShows
    case topRatedTVShows
    case tvShowDetails(id: Int)
}

extension EndPointTVShow: EndPointAPIType {
    var methods: String {
        return "GET"
    }
        
    var path: String {
        switch self {
        case .popularTVShows:
            return "tv/popular"
        case .topRatedTVShows:
            return "tv/top_rated"
        case .tvShowDetails(let id):
            return "tv/\(id)"
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
        case .tvShowDetails:
            return [
                URLQueryItem(name: "api_key", value: Constants.APIKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "id", value: "233643")
            ]
        case .popularTVShows, .topRatedTVShows:
            return [
                URLQueryItem(name: "api_key", value: Constants.APIKey),
                URLQueryItem(name: "language", value: "en-US")
            ]
        }
    }
}
