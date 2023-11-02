//
//  CastEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

struct CastEntity: Codable {
    let cast: [CastDetails]
    let crew: [CastDetails]
    let id: Int
}

struct CastDetails: Codable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let character: String?
    let creditId: String
    let order: Int?
    let department: String?
    let job: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity, character, order, department, job
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case creditId = "credit_id"
    }
}
