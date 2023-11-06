//
//  TVShowDetailsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol TVShowDetailsPresenterInterface {
    var view: TVShowDetailsViewInterface? { get set }
    var router: TVShowDetailsRouterInterface? { get set }
    var interactor: TVShowDetailsInteractorInterface? { get set }
    
    func getDetails()
    var castList: CastEntity? { get set }
    
    func getTVShowDetailsSuccess(data: TVShowByIDEntity)
    func getTVShowDetailsFailure(error: Error)
    
    func getCastDetailsSuccess(data: CastEntity)
    func getCastDetailsFailure(error: Error)
    
    func getVideosSuccess(data: VideoModel)
    func getVideosFailure(error: Error)
    
    func navigateToCastDetails(indexPath: IndexPath)
}

class TVShowDetailsPresenter: TVShowDetailsPresenterInterface {
    
    
    var view: TVShowDetailsViewInterface?
    var router: TVShowDetailsRouterInterface?
    var interactor: TVShowDetailsInteractorInterface?
    var tvShowId: Int?
    var castList: CastEntity?
    
    init(tvShowId: Int?) {
        self.tvShowId = tvShowId
    }
    
    func getDetails() {
        interactor?.getTVShowDetails(id: tvShowId ?? 200)
        interactor?.getCastDetails(id: tvShowId ?? 200)
        interactor?.getTvShowVideos(id: tvShowId ?? 200)
    }
    
    func getTVShowDetailsSuccess(data: TVShowByIDEntity) {
        convertDataToDetailsModel(data: data)
    }
    
    func convertDataToDetailsModel(data: TVShowByIDEntity) {
        let img = Constants.imgBaseUrl + (data.backdropPath ?? "")
        let title = data.name
        let genresList = data.genres
        var genre: String = ""
        genresList.forEach({ item in
            genre = genre + item.name + "/"
        })
        if genre.isEmpty == false {
            genre.removeLast()
        }
        
        let voteCount = "\(data.voteCount) votes"
        let voteAverage = data.voteAverage
        let date: String = data.firstAirDate.covertDate(date: data.firstAirDate)
        let description = data.overview
        let episodes = "Episodes: \(data.numberOfEpisodes)"
        let seasons = "Seasons: \(data.numberOfSeasons)"
        
        let tvShowDetails = MovieTVDetailsModel(image: img, title: title, genre: genre, voteCount: voteCount, voteAvg: voteAverage, date: date, description: description, runtime: nil, language: nil, episodes: episodes, seasons: seasons)
        view?.getTVShowDetailsSuccess(tvShowDetails: tvShowDetails)
    }
    
    func getTVShowDetailsFailure(error: Error) {
        view?.getTVShowDetailsFailure(error: error)
    }
    
    func getCastDetailsSuccess(data: CastEntity) {
        self.castList = data
        let castDetails = (data.cast.compactMap({ CellDataObject(title: $0.name, posterPath: $0.profilePath ?? "")}))
        view?.getCastsSuccess(castsData: castDetails)
    }
    
    func getCastDetailsFailure(error: Error) {
        view?.getCastsFailure(error: error)
    }
    
    func getVideosSuccess(data: VideoModel) {
        let videos = data.results.compactMap({ $0.key })
        view?.getVideosSuccess(castData: videos)
    }
    
    func getVideosFailure(error: Error) {
        view?.getVideosFailure(error: error)
    }

    
    func navigateToCastDetails(indexPath: IndexPath) {
        let castId = castList?.cast[indexPath.row].id
        router?.navigateToCastDetails(castId: castId)
    }
}
