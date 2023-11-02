//
//  KnownForEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

struct KnownForEntity: Codable {
    let cast: [KnownForDetails]
    let crew: [KnownForDetails]
    let id: Int
}

struct KnownForDetails: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String?
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let character: String?
    let creditId: String
    let order: Int?
    let originalName: String?
    let name: String?
    let episodeCount: Int?
    let originCountry: [String]?
    let department: String?
    let job: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, id, overview, popularity, title, video, character, order, name, department, job
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case creditId = "credit_id"
        case originalName = "original_name"
        case episodeCount = "episode_count"
        case originCountry = "origin_country"
    }
}
