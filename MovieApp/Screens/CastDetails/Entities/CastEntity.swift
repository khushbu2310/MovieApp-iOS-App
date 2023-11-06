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
    let id: Int
    let name: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePath = "profile_path"
    }
}
