//
//  MovieEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

struct MovieResult: Codable {
    let page: Int
    var results: [ResultDetails]
    let totalPages: Int
    let totalResults: Int
    let dates: DateStruct?
    
    enum CodingKeys: String, CodingKey {
        case page, results, dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultDetails: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult, id, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct DateStruct: Codable {
    let maximum: String
    let minimum: String
}

struct ResponseModel {
    let responseType: MovieTypesEnum
    let data: MovieResult
}
