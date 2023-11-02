//
//  CastRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

class CastRepository {
    
    var eventHandler: ((_ event: Event) -> Void)?
    var tvShowCastListData: CastEntity?
    var movieCastListData: CastEntity?
    var personDetailsByIdData: PersonDetailsByIdEntity?
    var personImagesByIdData: PersonImagesByIdEntity?
    var knownForCombineData: KnownForEntity?
    var knownForMoviesData: KnownForEntity?
    var knownForTvShowsData: KnownForEntity?
    
    func getTvShowCastListData() {
        self.eventHandler?(.loading)
        let tvShowId = 233643
        APIManager.shared.request(modelType: CastEntity.self, type: EndPointCast.tvShowsCastList(id: tvShowId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let tvShowCastList):
                self.tvShowCastListData = tvShowCastList
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }
    
    func getMovieCastListData() {
        self.eventHandler?(.loading)
        let movieId = 575264
        APIManager.shared.request(modelType: CastEntity.self, type: EndPointCast.moviesCastList(id: movieId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let movieCastList):
                self.movieCastListData = movieCastList
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }
    
    func getPersonDetailsByIdData() {
        self.eventHandler?(.loading)
        let personId = 500
        APIManager.shared.request(modelType: PersonDetailsByIdEntity.self, type: EndPointCast.personDetailsById(id: personId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let personDetails):
                self.personDetailsByIdData = personDetails
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }
    
    func getPersonImagesByIdData() {
        self.eventHandler?(.loading)
        let personId = 500
        APIManager.shared.request(modelType: PersonImagesByIdEntity.self, type: EndPointCast.personImagesById(id: personId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let personImages):
                self.personImagesByIdData = personImages
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }

    func getKnownForCombineData() {
        self.eventHandler?(.loading)
        let personId = 500
        APIManager.shared.request(modelType: KnownForEntity.self, type: EndPointCast.knownForCombine(id: personId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let personCombineDetails):
                self.knownForCombineData = personCombineDetails
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }

    func getKnownForMoviesData() {
        self.eventHandler?(.loading)
        let personId = 500
        APIManager.shared.request(modelType: KnownForEntity.self, type: EndPointCast.knownForMovies(id: personId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let personMovieDetails):
                self.knownForMoviesData = personMovieDetails
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }
    
    func getKnownForTvShowsData() {
        self.eventHandler?(.loading)
        let personId = 1937988
        APIManager.shared.request(modelType: KnownForEntity.self, type: EndPointCast.knownForTvShows(id: personId)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let personTvShowDetails):
                self.knownForTvShowsData = personTvShowDetails
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error.localizedDescription))
            }
        }
    }
}

extension CastRepository {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(String)
    }
}
