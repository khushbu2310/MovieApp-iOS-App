//
//  MovieByIDEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

struct MovieByIDEntity: Codable {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: BelongsToStruct?
    let budget: Int
    let genres: [Genres]
    let homepage: String
    let id: Int
    let imdbId: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompanies]
    let productionCountries: [ProductionCountries]
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguages]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult, budget, genres, homepage, id, overview, popularity, revenue, runtime, status, tagline, title, video
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}

struct BelongsToStruct: Codable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

struct Genres: Codable {
    let id: Int
    let name: String
}

struct ProductionCompanies: Codable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }

}

struct ProductionCountries: Codable {
    let iso_3166_1: String
    let name: String
}

struct SpokenLanguages: Codable {
    let englishName: String
    let iso_639_1: String
    let name: String
    enum CodingKeys: String, CodingKey {
        case iso_639_1, name
        case englishName = "english_name"
    }
}

struct MovieTVDetailsModel {
    let image: String
    let title: String
    let genre: String
    let voteCount: String
    let voteAvg: Double
    let date: String
    let description: String
    let runtime: String?
    let language: String?
    let episodes: String?
    let seasons: String?
}
