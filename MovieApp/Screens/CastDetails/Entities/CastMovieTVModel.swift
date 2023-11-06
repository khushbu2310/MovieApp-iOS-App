//
//  CastMovieTVModel.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

struct CastMovieTVModel: Codable {
    let cast: [CastMovieTVDetails]
    let id: Int
}

struct CastMovieTVDetails: Codable {
    let adult: Bool
    let backdropPath: String?
    let originalTitle: String?
    let originalName: String?
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, overview
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case originalName = "original_name"
    }
}
