//
//  PopularTVShowMockData.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp

let popularTVShowMockResponse = """
{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
            "genre_ids": [
                10763
            ],
            "id": 94722,
            "origin_country": [
                "DE"
            ],
            "original_language": "de",
            "original_name": "Tagesschau",
            "overview": "German daily news program, the oldest still existing program on German television.",
            "popularity": 3212.575,
            "poster_path": "/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg",
            "first_air_date": "1952-12-26",
            "name": "Tagesschau",
            "vote_average": 7.248,
            "vote_count": 161
        },
        {
            "adult": false,
            "backdrop_path": "/218ZehBKlH8efPRRccmB7bu0oLQ.jpg",
            "genre_ids": [
                35,
                9648,
                10766,
                18
            ],
            "id": 219109,
            "origin_country": [
                "BR"
            ],
            "original_language": "pt",
            "original_name": "Elas por Elas",
            "overview": "Seven friends who met in their youth at an English course meet again 25 years later; Lara, Taís, Helena, Adriana, Renée, Natália and Carol, each of them has a different personality and origin, but they share a deep affection.",
            "popularity": 2980.648,
            "poster_path": "/hCSH5KvSqShWXhFiXr88wtJXwlO.jpg",
            "first_air_date": "2023-09-25",
            "name": "Elas por Elas",
            "vote_average": 9.6,
            "vote_count": 5
        },
        {
            "adult": false,
            "backdrop_path": "/9xxLWtnFxkpJ2h1uthpvCRK6vta.jpg",
            "genre_ids": [
                80,
                18,
                9648
            ],
            "id": 2734,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Law & Order: Special Victims Unit",
            "overview": "In the criminal justice system, sexually-based offenses are considered especially heinous. In New York City, the dedicated detectives who investigate these vicious felonies are members of an elite squad known as the Special Victims Unit. These are their stories.",
            "popularity": 2489.731,
            "poster_path": "/ywBt4WKADdMVgxTR1rS2uFwMYTH.jpg",
            "first_air_date": "1999-09-20",
            "name": "Law & Order: Special Victims Unit",
            "vote_average": 7.957,
            "vote_count": 3429
        },
        {
            "adult": false,
            "backdrop_path": "/oOce9hLMVFubjAJliau4kiSNPnW.jpg",
            "genre_ids": [
                80,
                18
            ],
            "id": 549,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Law & Order",
            "overview": "In cases ripped from the headlines, police investigate serious and often deadly crimes, weighing the evidence and questioning the suspects until someone is taken into custody. The district attorney's office then builds a case to convict the perpetrator by proving the person guilty beyond a reasonable doubt. Working together, these expert teams navigate all sides of the complex criminal justice system to make New York a safer place.",
            "popularity": 2182.633,
            "poster_path": "/77OPlbsvX3pzoFbyfpcE3GXMCod.jpg",
            "first_air_date": "1990-09-13",
            "name": "Law & Order",
            "vote_average": 7.486,
            "vote_count": 466
        },
        {
            "adult": false,
            "backdrop_path": "/q3jHCb4dMfYF6ojikKuHd6LscxC.jpg",
            "genre_ids": [
                18,
                10765
            ],
            "id": 84958,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Loki",
            "overview": "After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant” or help fix the timeline and stop a greater threat.",
            "popularity": 2250.205,
            "poster_path": "/voHUmluYmKyleFkTu3lOXQG702u.jpg",
            "first_air_date": "2021-06-09",
            "name": "Loki",
            "vote_average": 8.2,
            "vote_count": 10487
        },
        {
            "adult": false,
            "backdrop_path": "/aDRIKJuB63tuJUZf1O4mRmbMTVw.jpg",
            "genre_ids": [
                10764
            ],
            "id": 6480,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "House Hunters",
            "overview": "Hosted by Suzanne Whang, the show takes viewers behind the scenes as individuals, couples and families learn what to look for and decide whether or not a home is meant for them. Focusing on the emotional experience of finding and purchasing a new home, each episode follows a prospective buyer and real estate agent through the home-buying process, from start to finish.",
            "popularity": 1539.458,
            "poster_path": "/7Bsr9ogG0q6yHtNuIp6bJ6EFpbH.jpg",
            "first_air_date": "1999-09-30",
            "name": "House Hunters",
            "vote_average": 5.1,
            "vote_count": 25
        },
        {
            "adult": false,
            "backdrop_path": "/l7LRGYJY3NzIGBlpvHpMsNXHbm5.jpg",
            "genre_ids": [
                10751,
                35
            ],
            "id": 218145,
            "origin_country": [
                "SK"
            ],
            "original_language": "sk",
            "original_name": "Mama na prenájom",
            "overview": "Abandoned by his wife, Martin is lying to his daughter not to be upset. But as Hanka grows, these lies become unbearable. Martin meets Nada unexpectedly, asked her to be a rent-a-mother and all lives are completely changed.",
            "popularity": 2967.489,
            "poster_path": "/fH7PP2Rkdlo414IHvZABBHhtoqd.jpg",
            "first_air_date": "2023-01-09",
            "name": "Mom for rent",
            "vote_average": 6.125,
            "vote_count": 8
        },
        {
            "adult": false,
            "backdrop_path": "/9TXcHOeCsM8W3ZKKIKjdYUsRSeq.jpg",
            "genre_ids": [
                80,
                18
            ],
            "id": 72879,
            "origin_country": [
                "FR"
            ],
            "original_language": "fr",
            "original_name": "Demain nous appartient",
            "overview": "The story revolves around the people of Sète, France. Their lives are punctuated by family rivalries, romance and scenes from daily life, but also by plots involving police investigations, secrets and betrayals.",
            "popularity": 2727.997,
            "poster_path": "/3uU5uJzOX7xe7mn7YKpBM9oiEZO.jpg",
            "first_air_date": "2017-07-17",
            "name": "Tomorrow is Ours",
            "vote_average": 6.337,
            "vote_count": 42
        },
        {
            "adult": false,
            "backdrop_path": "/hwUQsL1cWt0bmbTxzCompqqvTH9.jpg",
            "genre_ids": [
                10764
            ],
            "id": 82250,
            "origin_country": [
                "ES"
            ],
            "original_language": "es",
            "original_name": "Gran hermano VIP",
            "overview": "",
            "popularity": 2060.507,
            "poster_path": "/9269PATr0bmEXKjkpR88mzGmNYI.jpg",
            "first_air_date": "2004-01-22",
            "name": "Gran hermano VIP",
            "vote_average": 4.0,
            "vote_count": 7
        },
        {
            "adult": false,
            "backdrop_path": "/qmcoEOrTm6BcgR4iO7KBQKE9AKT.jpg",
            "genre_ids": [
                80,
                18,
                10759
            ],
            "id": 4614,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "NCIS",
            "overview": "From murder and espionage to terrorism and stolen submarines, a team of special agents investigates any crime that has a shred of evidence connected to Navy and Marine Corps personnel, regardless of rank or position.",
            "popularity": 1687.255,
            "poster_path": "/2exOHePjOTquUsbThPGhuEjYTyA.jpg",
            "first_air_date": "2003-09-23",
            "name": "NCIS",
            "vote_average": 7.63,
            "vote_count": 2069
        },
        {
            "adult": false,
            "backdrop_path": "/4w3AZvQMdzOS7oXXrrPnRD59dBr.jpg",
            "genre_ids": [
                10767
            ],
            "id": 569,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Around the Horn",
            "overview": "Around the Horn is a daily, half-hour sports roundtable on ESPN filmed in Washington, D.C. It airs at 5:00 pm ET, as part of a sports talk hour with Pardon the Interruption. The show is currently hosted by Tony Reali.",
            "popularity": 2508.992,
            "poster_path": "/jGJUpb4fZPaIs1oyFKn0AGjOq5b.jpg",
            "first_air_date": "2002-11-04",
            "name": "Around the Horn",
            "vote_average": 4.4,
            "vote_count": 5
        },
        {
            "adult": false,
            "backdrop_path": "/cvlLBcQWpO9X21jDHhgPJnE2aVq.jpg",
            "genre_ids": [
                80,
                18,
                9648
            ],
            "id": 1431,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "CSI: Crime Scene Investigation",
            "overview": "A Las Vegas team of forensic investigators are trained to solve criminal cases by scouring the crime scene, collecting irrefutable evidence and finding the missing pieces that solve the mystery.",
            "popularity": 1437.075,
            "poster_path": "/jBybUiienGpfLoDkbS5nvY4i40A.jpg",
            "first_air_date": "2000-10-06",
            "name": "CSI: Crime Scene Investigation",
            "vote_average": 7.647,
            "vote_count": 1071
        },
        {
            "adult": false,
            "backdrop_path": "/aWPhMZ0P2DyfWB7k5NXhGHSZHGC.jpg",
            "genre_ids": [
                18,
                80,
                10766
            ],
            "id": 209265,
            "origin_country": [
                "BR"
            ],
            "original_language": "pt",
            "original_name": "Terra e Paixão",
            "overview": "When her husband is killed in a land grabbing attempt, Aline takes charge of cultivating his land and protecting his family. Facing the powerful Antonio La Selva, responsible for the death of her husband and the largest landowner in the region, Aline is determined to keep possession of her land and invest in its production. However, she didn't expect that she would fall in love with Daniel, son of her rival, who is at odds with his rebellious half-brother, Caio, who, in turn, also falls in love with the girl. In the interior of Brazil, Aline will have to fight two battles: the dispute for her lands and for her heart.",
            "popularity": 1925.454,
            "poster_path": "/6SgKArqMYmqSl5XlHEucGXvotw.jpg",
            "first_air_date": "2023-05-08",
            "name": "Land of Desire",
            "vote_average": 6.541,
            "vote_count": 123
        },
        {
            "adult": false,
            "backdrop_path": "/rBF8wVQN8hTWHspVZBlI3h7HZJ.jpg",
            "genre_ids": [
                16,
                35,
                10765,
                10759
            ],
            "id": 60625,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Rick and Morty",
            "overview": "Rick is a mentally-unbalanced but scientifically gifted old man who has recently reconnected with his family. He spends most of his time involving his young grandson Morty in dangerous, outlandish adventures throughout space and alternate universes. Compounded with Morty's already unstable family life, these events cause Morty much distress at home and school.",
            "popularity": 1574.032,
            "poster_path": "/gdIrmf2DdY5mgN6ycVP0XlzKzbE.jpg",
            "first_air_date": "2013-12-02",
            "name": "Rick and Morty",
            "vote_average": 8.7,
            "vote_count": 8725
        },
        {
            "adult": false,
            "backdrop_path": "/wU1y7snEVYiJBpZ2k1DjIpHgJbx.jpg",
            "genre_ids": [
                16,
                35
            ],
            "id": 1434,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Family Guy",
            "overview": "Sick, twisted, politically incorrect and Freakin' Sweet animated series featuring the adventures of the dysfunctional Griffin family. Bumbling Peter and long-suffering Lois have three kids. Stewie (a brilliant but sadistic baby bent on killing his mother and taking over the world), Meg (the oldest, and is the most unpopular girl in town) and Chris (the middle kid, he's not very bright but has a passion for movies). The final member of the family is Brian - a talking dog and much more than a pet, he keeps Stewie in check whilst sipping Martinis and sorting through his own life issues.",
            "popularity": 1441.659,
            "poster_path": "/hw2vi8agaJZ7oeSvS8uEYgOtK32.jpg",
            "first_air_date": "1999-01-31",
            "name": "Family Guy",
            "vote_average": 7.295,
            "vote_count": 3932
        },
        {
            "adult": false,
            "backdrop_path": "/i4n8ZKmCUaxcGMkPhm12selZiff.jpg",
            "genre_ids": [
                18,
                10766
            ],
            "id": 226411,
            "origin_country": [
                "ES"
            ],
            "original_language": "es",
            "original_name": "Mía es la venganza",
            "overview": "",
            "popularity": 2261.598,
            "poster_path": "/wysp5AcY9JpLjje5NunKYw7Mrtc.jpg",
            "first_air_date": "2023-06-12",
            "name": "Mía es la venganza",
            "vote_average": 7.0,
            "vote_count": 61
        },
        {
            "adult": false,
            "backdrop_path": "/ffyxj73OyMEgwS1JiluoYzd3VGb.jpg",
            "genre_ids": [
                18
            ],
            "id": 4601,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Law & Order: Criminal Intent",
            "overview": "The third installment of the “Law & Order” franchise takes viewers deep into the minds of its criminals while following the intense psychological approaches the Major Case Squad uses to solve its crimes.",
            "popularity": 1399.746,
            "poster_path": "/mwynkwd6jql0qamRW6i5Dv6aZ4k.jpg",
            "first_air_date": "2001-09-30",
            "name": "Law & Order: Criminal Intent",
            "vote_average": 7.591,
            "vote_count": 303
        },
        {
            "adult": false,
            "backdrop_path": "/xl1wGwaPZInJo1JAnpKqnFozWBE.jpg",
            "genre_ids": [
                35,
                10767
            ],
            "id": 59941,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "The Tonight Show Starring Jimmy Fallon",
            "overview": "After Jay Leno's second retirement from the program, Jimmy Fallon stepped in as his permanent replacement. After 42 years in Los Angeles the program was brought back to New York.",
            "popularity": 1688.909,
            "poster_path": "/g4amxJvtpnY79J77xeamnAEUO8r.jpg",
            "first_air_date": "2014-02-17",
            "name": "The Tonight Show Starring Jimmy Fallon",
            "vote_average": 6.004,
            "vote_count": 237
        },
        {
            "adult": false,
            "backdrop_path": "/7FFeWCB2EcBpmsBMHKat7TSqSJw.jpg",
            "genre_ids": [],
            "id": 30048,
            "origin_country": [
                "US"
            ],
            "original_language": "en",
            "original_name": "Tony Awards",
            "overview": "The Antoinette Perry Award for Excellence in Theatre, more commonly known as a Tony Award, recognizes achievement in live Broadway theatre. The awards are presented by the American Theatre Wing and The Broadway League at an annual ceremony in New York City. The awards are given for Broadway productions and performances, and an award is given for regional theatre.",
            "popularity": 1769.345,
            "poster_path": "/6BXIIGyl9MQiJhkxcGCcrcoAzMz.jpg",
            "first_air_date": "1956-04-01",
            "name": "Tony Awards",
            "vote_average": 5.0,
            "vote_count": 8
        },
        {
            "adult": false,
            "backdrop_path": null,
            "genre_ids": [
                10764
            ],
            "id": 237019,
            "origin_country": [
                "GB"
            ],
            "original_language": "en",
            "original_name": "Big Brother: Live Stream",
            "overview": "Big Brother sees it all - and so can you.",
            "popularity": 1685.515,
            "poster_path": "/sYuUb7W2DyLux7paqF4Oob3z2bF.jpg",
            "first_air_date": "2023-10-08",
            "name": "Big Brother: Live Stream",
            "vote_average": 0.0,
            "vote_count": 0
        }
    ],
    "total_pages": 7941,
    "total_results": 158803
}
""".data(using: .utf8)


func getPopularTVShowMockData() -> TVShowResult? {
    var response: TVShowResult?
    do {
        guard let data = popularTVShowMockResponse else {
            print("Nil data in tvShow Video Mock data")
            return nil
        }
        response = try JSONDecoder().decode(TVShowResult.self, from: data)
    } catch let error {
        print("Error in converting movieVideoMockResponse to Video Model: \(error)")
        return nil
    }
    return response
}

var popularTVShowMockData: TVShowResult? = getPopularTVShowMockData()

