//
//  PersonDetailsByIdEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation
struct PersonDetailsByIdEntity: Codable {
    let adult: Bool
    let alsoKnownAs: [String]
    let biography: String
    let birthday: String
    let deathday: String?
    let gender: Int
    let homepage: String
    let id: Int
    let imdbId: String
    let knownForDepartment: String
    let name: String
    let placeOfBirth: String
    let popularity: Double
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case adult, biography, birthday, deathday, gender, homepage, id, name, popularity
        case alsoKnownAs = "also_known_as"
        case imdbId = "imdb_id"
        case knownForDepartment = "known_for_department"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
}
