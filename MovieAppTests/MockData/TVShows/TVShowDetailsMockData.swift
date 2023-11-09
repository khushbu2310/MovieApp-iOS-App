//
//  TVShowDetailsMockData.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp

let tvShowDetailsMockResponse = """
{
        "adult": false,
        "backdrop_path": "/akW2Vt85HZ6qtUjDt1JTtQqB3Jm.jpg",
        "created_by": [],
        "episode_run_time": [],
        "first_air_date": "2023-10-02",
        "genres": [
            {
                "id": 16,
                "name": "Animation"
            }
        ],
        "homepage": "https://secretmission.af-original.jp",
        "id": 233643,
        "in_production": true,
        "languages": [
            "ja"
        ],
        "last_air_date": "2023-10-30",
        "last_episode_to_air": {
            "id": 4889552,
            "name": "Episode 5",
            "overview": "",
            "vote_average": 0.0,
            "vote_count": 0,
            "air_date": "2023-10-30",
            "episode_number": 5,
            "episode_type": "standard",
            "production_code": "",
            "runtime": 6,
            "season_number": 1,
            "show_id": 233643,
            "still_path": "/61bNAL4278kFb1pCXl7jm9gkkiD.jpg"
        },
        "name": "Secret Mission: Sennyuu Sousakan wa Zettai ni Makenai!",
        "next_episode_to_air": null,
        "networks": [
            {
                "id": 614,
                "logo_path": "/hSdroyVthq3CynxTIIY7lnS8w1.png",
                "name": "Tokyo MX",
                "origin_country": "JP"
            },
            {
                "id": 861,
                "logo_path": "/JQ5bx6n7Qmdmyqz6sqjo5Fz2iR.png",
                "name": "BS11",
                "origin_country": "JP"
            }
        ],
        "number_of_episodes": 5,
        "number_of_seasons": 1,
        "origin_country": [
            "JP"
        ],
        "original_language": "ja",
        "original_name": "しーくれっとみっしょん～潜入捜査官は絶対に負けない！～",
        "overview": "The story follows two undercover agents Riko Ikazuchi and her junior partner Noma, who are infiltrating an apartment that is also the hideout of a criminal organization. They pretend to be newlyweds. However, when the culprits do not hear noise from them at night, they get suspicious. In order to convince the culprits that they are a married in couple in love, they start to touch and make some noise... Despite feelings of humiliation and pleasure throughout the undercover investigations, Riko endures it and devotes herself to her justice.",
        "popularity": 1162.945,
        "poster_path": "/ipqu76qqHiVB2vlK2gGZNwF9SwX.jpg",
        "production_companies": [
            {
                "id": 152965,
                "logo_path": null,
                "name": "Rabbit Gate",
                "origin_country": "JP"
            },
            {
                "id": 149421,
                "logo_path": "/6UqbB0NLRWEIaCKsd5YkOigJgXb.png",
                "name": "Suiseisha",
                "origin_country": "JP"
            }
        ],
        "production_countries": [
            {
                "iso_3166_1": "JP",
                "name": "Japan"
            }
        ],
        "seasons": [
            {
                "air_date": "2023-10-02",
                "episode_count": 5,
                "id": 354642,
                "name": "Season 1",
                "overview": "",
                "poster_path": "/ipqu76qqHiVB2vlK2gGZNwF9SwX.jpg",
                "season_number": 1,
                "vote_average": 9.3
            }
        ],
        "spoken_languages": [
            {
                "english_name": "Japanese",
                "iso_639_1": "ja",
                "name": "日本語"
            }
        ],
        "status": "Returning Series",
        "tagline": "",
        "type": "Scripted",
        "vote_average": 5.5,
        "vote_count": 9
    }
""".data(using: .utf8)


func getTVShowDetailsMockData() -> TVShowByIDEntity? {
    var response: TVShowByIDEntity?
    do {
        guard let data = tvShowDetailsMockResponse else {
            print("Nil data in tvShow Video Mock data")
            return nil
        }
        response = try JSONDecoder().decode(TVShowByIDEntity.self, from: data)
    } catch let error {
        print("Error in converting movieVideoMockResponse to Video Model: \(error)")
        return nil
    }
    return response
}

var tvShowDetailsMockData: TVShowByIDEntity? = getTVShowDetailsMockData()
