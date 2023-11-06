//
//  TVShowByIDEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

//struct TVShowByIDEntity: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let createdBy: [String]
//    let firstAirDate: String
//    let genres: [GenresDetail]
//    let homepage: String
//    let id: Int
//    let inProduction: Bool
//    let languages: [String]
//    let lastAirDate: String
//    let lastEpisodeToAir: LastEpisodeToAirDetails?
//    let name: String
//    let networks: [Networks]
//    let numberOfEpisodes: Int
//    let numberOfSeasons: Int
//    let originCountry: [String]
//    let originalLanguage: String
//    let originalName: String
//    let overview: String
//    let popularity: Double
//    let posterPath: String?
//    let productionCompanies: [ProductionCompaniesDetails]
//    let productionCountries: [ProductionCountriesDetails]
//    let spokenLanguages: [SpokenLanguagesDetails]
//    let status: String
//    let tagline: String
//    let type: String
//    let voteAverage: Double
//    let voteCount: Int
//    
//    enum CodingKeys: String, CodingKey {
//        case adult, genres, homepage, id, languages, name, networks, overview, popularity, status, tagline, type
//        case backdropPath = "backdrop_path"
//        case createdBy = "created_by"
//        case firstAirDate = "first_air_date"
//        case inProduction = "in_production"
//        case lastAirDate = "last_air_date"
//        case lastEpisodeToAir = "last_episode_to_air"
//        case numberOfEpisodes = "number_of_episodes"
//        case numberOfSeasons = "number_of_seasons"
//        case originCountry = "origin_country"
//        case originalLanguage = "original_language"
//        case originalName = "original_name"
//        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
//        case spokenLanguages = "spoken_languages"
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//struct GenresDetail: Codable {
//    let id: Int
//    let name: String
//}
//
//struct LastEpisodeToAirDetails: Codable {
//    let id: Int
//    let name: String
//    let overview: String
//    let voteAverage: Double
//    let voteCount: Int
//    let airDate: String
//    let episodeNumber: Int
//    let episodeType: String
//    let productionCode: String
//    let runtime: Int
//    let seasonNumber: Int
//    let showId: Int
//    let stillPath: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case id, name, overview, runtime
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//        case airDate = "air_date"
//        case episodeNumber = "episode_number"
//        case episodeType = "episode_type"
//        case productionCode = "production_code"
//        case seasonNumber = "season_number"
//        case showId = "show_id"
//        case stillPath = "still_path"
//    }
//}
//
//struct Networks: Codable {
//    let id: Int
//    let logoPath: String
//    let name: String
//    let originCountry: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case logoPath = "logo_path"
//        case originCountry = "origin_country"
//    }
//}
//
//struct ProductionCompaniesDetails: Codable {
//    let id: Int
//    let logoPath: String?
//    let name: String
//    let originCountry: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case logoPath = "logo_path"
//        case originCountry = "origin_country"
//    }
//}
//
//struct ProductionCountriesDetails: Codable {
//    let iso_3166_1: String
//    let name: String
//}
//
//struct SpokenLanguagesDetails: Codable {
//    let englishName: String
//    let iso_639_1: String
//    let name: String
//    
//    enum CodingKeys: String, CodingKey {
//        case iso_639_1, name
//        case englishName = "english_name"
//    }
//}

struct TVShowByIDEntity: Codable {
    let adult: Bool
    let backdropPath: String?
    let firstAirDate: String
    let genres: [GenresDetail]
    let id: Int
    let lastAirDate: String
    let name: String
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let overview: String
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genres
        case id
        case lastAirDate = "last_air_date"
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct GenresDetail: Codable {
    let id: Int
    let name: String
}
