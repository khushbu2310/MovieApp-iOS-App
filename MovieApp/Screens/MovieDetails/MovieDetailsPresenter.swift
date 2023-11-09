//
//  MovieDetailsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation

protocol MovieDetailsViewToPresenterInterface {
    var view: MovieDetailsViewInterface? { get set }
    func getMovieDetails()
    func navigateToCastDetails(indexPath: IndexPath)
}

protocol MovieDetailsInteractorToPresenterInterface {
    var interactor: MovieDetailsInteractorInterface? { get set }
    var castList: CastEntity? { get set }
    func getMovieDetailsSuccess<T: Codable>(movieDetailsData: T)
    func getMovieDetailsFailure(error: Error)
}

protocol MovieDetailsRouterToPresenterInterface {
    var router: MovieDetailsRouterInterface? { get set }
    var movieId: Int? { get set }
}

class MovieDetailsPresenter: MovieDetailsViewToPresenterInterface, MovieDetailsInteractorToPresenterInterface, MovieDetailsRouterToPresenterInterface {
        
    var view: MovieDetailsViewInterface?
    var router: MovieDetailsRouterInterface?
    var interactor: MovieDetailsInteractorInterface?
    var movieId: Int?
    var castList: CastEntity?
    var movieDetails: MovieByIDEntity?
    var videoDetails: VideoModel?
    var error: DataError?
    
    init(movieId: Int?) {
        self.movieId = movieId
    }
    
    func getMovieDetails() {
        interactor?.getMovieData(modelType: MovieByIDEntity.self, type: EndPointMovie.movieDetails(id: movieId ?? 500))
        interactor?.getMovieData(modelType: CastEntity.self, type: EndPointCast.moviesCastList(id: movieId ?? 500))
        interactor?.getMovieData(modelType: VideoModel.self, type: EndPointMovie.movieVideoDetails(id: movieId ?? 500))
    }

    func getMovieDetailsSuccess<T: Codable>(movieDetailsData: T) {
        switch movieDetailsData {
            
        case is MovieByIDEntity:
            guard let movieDetailsData = movieDetailsData as? MovieByIDEntity else { return }
            self.movieDetails = movieDetailsData
            let movieData = convertDataToDetailsModel(data: movieDetailsData)
            view?.getMovieDetailsSuccess(movieDetails: movieData)
            
        case is CastEntity:
            guard let castDetails = movieDetailsData as? CastEntity else { return }
            self.castList = castDetails
            let castData = castDetails.cast.compactMap({ CellDataObject(title: $0.name, posterPath: $0.profilePath ?? "")})
            view?.getCastsSuccess(castsData: castData)
            
        case is VideoModel:
            guard let videoDetails = movieDetailsData as? VideoModel else { return }
            self.videoDetails = videoDetails
            let videoData = videoDetails.results.compactMap({ $0.key })
            view?.getVideosSuccess(castData: videoData)
            
        default:
            break
        }
    }
    
    func convertDataToDetailsModel(data: MovieByIDEntity) -> MovieTVDetailsModel {
        let img = Constants.imgBaseUrl + (data.backdropPath ?? "")
        let title = data.title
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
        let date: String = data.releaseDate.covertDate(date: data.releaseDate)
        let runtime = "\(data.runtime.description.convertMinutesToHourMinutes(minutes: data.runtime))/ \(data.runtime) min"
        let language = "\(data.spokenLanguages[0].englishName)"
        let description = data.overview
        
        let movieDetails = MovieTVDetailsModel(image: img, title: title, genre: genre, voteCount: voteCount, voteAvg: voteAverage, date: date, description: description, runtime: runtime, language: language, episodes: nil, seasons: nil)
        return movieDetails
    }
    
    func getMovieDetailsFailure(error: Error) {
        self.error = error as? DataError
        view?.getMovieDataFailure(error: error)
    }
            
    func navigateToCastDetails(indexPath: IndexPath) {
        let castId = castList?.cast[indexPath.row].id
        router?.navigateToCastDetails(castId: castId)
    }
    
}
