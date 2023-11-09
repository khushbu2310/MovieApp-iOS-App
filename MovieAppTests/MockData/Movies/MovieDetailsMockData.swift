//
//  MovieDetailsMockData.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp

let movieDetailsMockResponse = """
{
  "adult": false,
  "backdrop_path": "/jqFjgNnxpXIXWuPsyfqmcLXRo9p.jpg",
  "belongs_to_collection": null,
  "budget": 1200000,
  "genres": [
    {
      "id": 80,
      "name": "Crime"
    },
    {
      "id": 53,
      "name": "Thriller"
    }
  ],
  "homepage": "",
  "id": 500,
  "imdb_id": "tt0105236",
  "original_language": "en",
  "original_title": "Reservoir Dogs",
  "overview": "A botched robbery indicates a police informant, and the pressure mounts in the aftermath at a warehouse. Crime begets violence as the survivors -- veteran Mr. White, newcomer Mr. Orange, psychopathic parolee Mr. Blonde, bickering weasel Mr. Pink and Nice Guy Eddie -- unravel.",
  "popularity": 36.335,
  "poster_path": "/xi8Iu6qyTfyZVDVy60raIOYJJmk.jpg",
  "production_companies": [
    {
      "id": 285,
      "logo_path": null,
      "name": "Live Entertainment",
      "origin_country": "US"
    },
    {
      "id": 26198,
      "logo_path": null,
      "name": "Dog Eat Dog Productions",
      "origin_country": ""
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "US",
      "name": "United States of America"
    }
  ],
  "release_date": "1992-09-02",
  "revenue": 2859750,
  "runtime": 99,
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    }
  ],
  "status": "Released",
  "tagline": "Every dog has his day.",
  "title": "Reservoir Dogs",
  "video": false,
  "vote_average": 8.131,
  "vote_count": 13385
}
""".data(using: .utf8)


func getMovieDetailsMockData() -> MovieByIDEntity? {
    var response: MovieByIDEntity?
    do {
        guard let data = movieDetailsMockResponse else {
            print("Nil data in tvShow Video Mock data")
            return nil
        }
        response = try JSONDecoder().decode(MovieByIDEntity.self, from: data)
    } catch let error {
        print("Error in converting movieVideoMockResponse to Video Model: \(error)")
        return nil
    }
    return response
}

var movieDetailsMockData: MovieByIDEntity? = getMovieDetailsMockData()
