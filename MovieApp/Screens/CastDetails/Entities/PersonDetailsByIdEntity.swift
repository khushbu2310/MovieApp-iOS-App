//
//  PersonDetailsByIdEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation
struct PersonDetailsByIdEntity: Codable {
    let adult: Bool
    let biography: String
    let birthday: String?
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let placeOfBirth: String
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case adult, biography, birthday, gender, id, name
        case knownForDepartment = "known_for_department"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
}
