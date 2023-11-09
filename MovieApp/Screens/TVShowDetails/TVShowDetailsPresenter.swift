//
//  TVShowDetailsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol TVShowDetailsViewToPresenterInterface {
    var view: TVShowDetailsViewInterface? { get set }
    func getTVShowDetails()
    func navigateToCastDetails(indexPath: IndexPath)
}

protocol TVShowDetailsInteractorToPresenterInterface {
    var interactor: TVShowDetailsInteractorInterface? { get set }
    var castList: CastEntity? { get set }
    func getTVShowDetailsSuccess<T: Codable>(tvShowDetailsData: T)
    func getTVShowDetailsFailure(error: Error)
}

protocol TVShowDetailsRouterToPresenterInterface {
    var router: TVShowDetailsRouterInterface? { get set }
    var tvShowId: Int? { get set }
}

class TVShowDetailsPresenter: TVShowDetailsViewToPresenterInterface, TVShowDetailsInteractorToPresenterInterface, TVShowDetailsRouterToPresenterInterface {
    
    var view: TVShowDetailsViewInterface?
    var router: TVShowDetailsRouterInterface?
    var interactor: TVShowDetailsInteractorInterface?
    var tvShowId: Int?
    var castList: CastEntity?
    var tvShowDetails: TVShowByIDEntity?
    var videoDetails: VideoModel?
    var error: DataError?
    
    init(tvShowId: Int?) {
        self.tvShowId = tvShowId
    }
    
    func getTVShowDetails() {
        interactor?.getTVShowData(modelType: TVShowByIDEntity.self, type: EndPointTVShow.tvShowDetails(id: tvShowId ?? 500))
        interactor?.getTVShowData(modelType: CastEntity.self, type: EndPointCast.tvShowsCastList(id: tvShowId ?? 500))
        interactor?.getTVShowData(modelType: VideoModel.self, type: EndPointTVShow.tvShowVideoDetails(id: tvShowId ?? 500))
    }
    
    func getTVShowDetailsSuccess<T: Codable>(tvShowDetailsData: T) {
        switch tvShowDetailsData {
            
        case is TVShowByIDEntity:
            guard let tvShowDetailsData = tvShowDetailsData as? TVShowByIDEntity else { return }
            self.tvShowDetails = tvShowDetailsData
            let tvShowData = convertDataToDetailsModel(data: tvShowDetailsData)
            view?.getTVShowDetailsSuccess(tvShowDetails: tvShowData)
            
        case is CastEntity:
            guard let castDetails = tvShowDetailsData as? CastEntity else { return }
            self.castList = castDetails
            let castData = castDetails.cast.compactMap({ CellDataObject(title: $0.name, posterPath: $0.profilePath ?? "")})
            view?.getCastsSuccess(castsData: castData)
            
        case is VideoModel:
            guard let videoDetails = tvShowDetailsData as? VideoModel else { return }
            self.videoDetails = videoDetails
            let videoData = videoDetails.results.compactMap({ $0.key })
            view?.getVideosSuccess(castData: videoData)
            
        default:
            break
        }
    }
    
    func convertDataToDetailsModel(data: TVShowByIDEntity) -> MovieTVDetailsModel {
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
        return tvShowDetails
    }
    
    func getTVShowDetailsFailure(error: Error) {
        self.error = error as? DataError
        view?.getTVShowDataFailure(error: error)
    }
    
    func navigateToCastDetails(indexPath: IndexPath) {
        let castId = castList?.cast[indexPath.row].id
        router?.navigateToCastDetails(castId: castId)
    }
}
