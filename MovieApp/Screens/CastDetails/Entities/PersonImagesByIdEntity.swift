//
//  PersonImagesByIdEntity.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

struct PersonImagesByIdEntity: Codable {
    let id: Int
    let profiles: [Profiles]
}

struct Profiles: Codable {
    let aspectRatio: Double
    let height: Int
    let filePath: String
    let voteAverage: Double
    let voteCount: Int
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
