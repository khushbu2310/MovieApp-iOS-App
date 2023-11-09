//
//  CastImageMockData.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp

let castImageMockResponse = """
    {
        "id": 500,
        "profiles": [
            {
                "aspect_ratio": 0.667,
                "height": 861,
                "iso_639_1": null,
                "file_path": "/eOh4ubpOm2Igdg0QH2ghj0mFtC.jpg",
                "vote_average": 5.328,
                "vote_count": 38,
                "width": 574
            },
            {
                "aspect_ratio": 0.667,
                "height": 720,
                "iso_639_1": null,
                "file_path": "/57wg0qQcS3OUl7euj1kQItGn05r.jpg",
                "vote_average": 5.292,
                "vote_count": 18,
                "width": 480
            },
            {
                "aspect_ratio": 0.667,
                "height": 2100,
                "iso_639_1": null,
                "file_path": "/8qBylBsQf4llkGrWR3qAsOtOU8O.jpg",
                "vote_average": 5.27,
                "vote_count": 54,
                "width": 1400
            },
            {
                "aspect_ratio": 0.666,
                "height": 1016,
                "iso_639_1": null,
                "file_path": "/5sjLDtdwjuVdZNdrnbAwDQdn5W.jpg",
                "vote_average": 5.244,
                "vote_count": 21,
                "width": 677
            },
            {
                "aspect_ratio": 0.667,
                "height": 1500,
                "iso_639_1": null,
                "file_path": "/h6ShtVkFKOaBaWhAAUbdmHIpkak.jpg",
                "vote_average": 5.226,
                "vote_count": 15,
                "width": 1000
            },
            {
                "aspect_ratio": 0.667,
                "height": 2100,
                "iso_639_1": null,
                "file_path": "/rZXZWW00hiZyVVBtXKBozAAq0Cf.jpg",
                "vote_average": 5.19,
                "vote_count": 37,
                "width": 1400
            },
            {
                "aspect_ratio": 0.667,
                "height": 852,
                "iso_639_1": null,
                "file_path": "/yUsSJ0vO8AM9HnDQWuGKMSzCKOP.jpg",
                "vote_average": 5.172,
                "vote_count": 16,
                "width": 568
            },
            {
                "aspect_ratio": 0.666,
                "height": 800,
                "iso_639_1": null,
                "file_path": "/gextEr8Tz4qT7Cwv1Xc82S7cTHx.jpg",
                "vote_average": 5.136,
                "vote_count": 21,
                "width": 533
            },
            {
                "aspect_ratio": 0.667,
                "height": 840,
                "iso_639_1": null,
                "file_path": "/9pTIJwjH3Wg8JAxt0TNTpu0cXK0.jpg",
                "vote_average": 5.128,
                "vote_count": 19,
                "width": 560
            },
            {
                "aspect_ratio": 0.667,
                "height": 1800,
                "iso_639_1": null,
                "file_path": "/2Dkx4uuGoWFrPSitxdikv9z5azR.jpg",
                "vote_average": 5.108,
                "vote_count": 39,
                "width": 1200
            },
            {
                "aspect_ratio": 0.667,
                "height": 600,
                "iso_639_1": null,
                "file_path": "/s57wicK5nPuYhglUFUWECjnomJL.jpg",
                "vote_average": 5.078,
                "vote_count": 20,
                "width": 400
            },
            {
                "aspect_ratio": 0.667,
                "height": 994,
                "iso_639_1": null,
                "file_path": "/vQFCioXTiCBBJaWeBDKD8mXZJ8V.jpg",
                "vote_average": 5.068,
                "vote_count": 18,
                "width": 663
            },
            {
                "aspect_ratio": 0.667,
                "height": 1500,
                "iso_639_1": null,
                "file_path": "/bn9CwMSM3o4XPZEPZdQ3grslGup.jpg",
                "vote_average": 5.058,
                "vote_count": 27,
                "width": 1000
            },
            {
                "aspect_ratio": 0.667,
                "height": 1440,
                "iso_639_1": null,
                "file_path": "/cMwXD3eiUfStgVh1gpVcwCnNelv.jpg",
                "vote_average": 4.956,
                "vote_count": 18,
                "width": 960
            }
        ]
    }
""".data(using: .utf8)

func getCastImageMockData() -> CastImagesByIdEntity? {
    let response: CastImagesByIdEntity?
    do {
        guard let data = castImageMockResponse else {
            print("Nil returned CastImageMock data")
            return nil
        }
        response =  try JSONDecoder().decode(CastImagesByIdEntity.self, from: data)
    } catch let error {
        print("Error in converting castImageMockData to CastMovieTVModel: \(error)")
        return nil
    }
    return response
}

var castImageMockData: CastImagesByIdEntity? = getCastImageMockData()
