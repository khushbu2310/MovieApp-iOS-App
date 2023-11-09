//
//  CastTVShowMockData.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp

let castTVShowMockResponse = """
    {
        "cast": [
            {
                "adult": true,
                "gender": 1,
                "id": 1937988,
                "known_for_department": "Acting",
                "name": "Sahomi Koyama",
                "original_name": "Sahomi Koyama",
                "popularity": 21.298,
                "profile_path": "/iRWyY5PUi7IoFxxrRv0DoQ9Qane.jpg",
                "character": "Riko Ikazuchi (voice)",
                "credit_id": "64f095bdcaa50800c886d2ee",
                "order": 0
            },
            {
                "adult": true,
                "gender": 2,
                "id": 1252617,
                "known_for_department": "Acting",
                "name": "Jun Osuka",
                "original_name": "Jun Osuka",
                "popularity": 1.316,
                "profile_path": "/idV7H8BvkcMvbFFHtqmQ5E0A19f.jpg",
                "character": "Keiji Noma (voice)",
                "credit_id": "64f095c7ebb99d011d5aa016",
                "order": 1
            }
        ],
        "crew": [
            {
                "adult": false,
                "gender": 2,
                "id": 1722605,
                "known_for_department": "Sound",
                "name": "Hisayoshi Hirasawa",
                "original_name": "Hisayoshi Hirasawa",
                "popularity": 2.327,
                "profile_path": null,
                "credit_id": "64f0913277d23b010d6bb468",
                "department": "Sound",
                "job": "Sound Director"
            },
            {
                "adult": true,
                "gender": 0,
                "id": 1899106,
                "known_for_department": "Directing",
                "name": "Saburou Miura",
                "original_name": "Saburou Miura",
                "popularity": 0.6,
                "profile_path": null,
                "credit_id": "64f09143caa50800e951aa93",
                "department": "Writing",
                "job": "Series Composition"
            },
            {
                "adult": true,
                "gender": 0,
                "id": 1899106,
                "known_for_department": "Directing",
                "name": "Saburou Miura",
                "original_name": "Saburou Miura",
                "popularity": 0.6,
                "profile_path": null,
                "credit_id": "64f0914677d23b00ec0424f0",
                "department": "Directing",
                "job": "Series Director"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 4245160,
                "known_for_department": "Writing",
                "name": "mothicaw",
                "original_name": "mothicaw",
                "popularity": 0.694,
                "profile_path": null,
                "credit_id": "64f091563a993700c5c3ff93",
                "department": "Writing",
                "job": "Comic Book"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 3319023,
                "known_for_department": "Visual Effects",
                "name": "LAZZ",
                "original_name": "LAZZ",
                "popularity": 1.4,
                "profile_path": null,
                "credit_id": "64f091b597a4e600c486b5ba",
                "department": "Visual Effects",
                "job": "Character Designer"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 3319023,
                "known_for_department": "Visual Effects",
                "name": "LAZZ",
                "original_name": "LAZZ",
                "popularity": 1.4,
                "profile_path": null,
                "credit_id": "64f091b8dbbb42011b709ed4",
                "department": "Visual Effects",
                "job": "Supervising Animation Director"
            }
        ],
        "id": 233643
    }
""".data(using: .utf8)

func getCastTVShowMockData() -> CastEntity? {
    let response: CastEntity?
        do {
        guard let data = castTVShowMockResponse else {
            print("Nil data in cast TVShow Mock data")
            return nil
        }
        response =  try JSONDecoder().decode(CastEntity.self, from: data)
    } catch let error {
        print("Error in converting castTVShowMockData to CastEntity: \(error)")
        return nil
    }
    return response
}

var castTVShowMockData: CastEntity? = getCastTVShowMockData()
