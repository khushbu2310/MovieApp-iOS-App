//
//  CastDetailsMockData.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp

let castDetailsMockResponse = """
{
    "adult": false,
    "also_known_as": [
        "Том Круз",
        "トム・クルーズ",
        "ทอม ครูซ",
        "湯姆·克魯斯",
        "톰 크루즈",
        "توم كروز",
        "Thomas Cruise Mapother IV",
        "Τομ Κρουζ",
        "טום קרוז",
        "Thomas 'Tom' Cruise",
        "汤姆·克鲁斯",
        "TC",
        "Toms Krūzs",
        "تام کروز"
    ],
    "biography": "Thomas Cruise Mapother IV (born July 3, 1962), known professionally as Tom Cruise, is an American actor and producer.",
    "birthday": "1962-07-03",
    "deathday": null,
    "gender": 2,
    "homepage": "http://www.tomcruise.com",
    "id": 500,
    "imdb_id": "nm0000129",
    "known_for_department": "Acting",
    "name": "Tom Cruise",
    "place_of_birth": "Syracuse, New York, USA",
    "popularity": 60.954,
    "profile_path": "/eOh4ubpOm2Igdg0QH2ghj0mFtC.jpg"
}
""".data(using: .utf8)

func getCastDetailsMockData() -> CastDetailsByIdEntity? {
    let response: CastDetailsByIdEntity?
    do {
        guard let data = castDetailsMockResponse else {
            print("Nil data in cast Movie Mock data")
            return nil
        }
        response =  try JSONDecoder().decode(CastDetailsByIdEntity.self, from: data)
    } catch let error {
        print("Error in converting castMovieMockData to CastEntity: \(error)")
        return nil
    }
    return response
}

var castDetailsMockData: CastDetailsByIdEntity? = getCastDetailsMockData()
