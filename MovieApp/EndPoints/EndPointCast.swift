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
    case castDetailsById(id: Int)
    case castImagesById(id: Int)
    case knownForCombine(id: Int)
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
        case .castDetailsById(let id):
            return "person/\(id)"
        case .castImagesById(let id):
            return "person/\(id)/images"
        case .knownForCombine(let id):
            return "person/\(id)/combined_credits"
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
        case .tvShowsCastList(let id), .moviesCastList(let id), .castDetailsById(let id), .castImagesById(let id), .knownForCombine(let id):
            return [
                URLQueryItem(name: "api_key", value: Constants.APIKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "id", value: String(id))
            ]
        }
    }
}
