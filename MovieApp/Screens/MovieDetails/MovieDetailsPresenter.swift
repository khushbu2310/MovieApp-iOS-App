//
//  MovieDetailsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation

protocol MovieDetailsPresenterInterface {
    var view: MovieDetailsViewInterface? { get set }
    var router: MovieDetailsRouterInterface? { get set }
    var interactor: MovieDetailsInteractorInterface? { get set }
    
    var movieId: Int? { get set }
    func getDetails()
    
    func getMovieDetailsSuccess(data: MovieByIDEntity)
    func getMovieDetailsFailure(error: Error)
    
    func getCastDetailsSuccess(data: CastEntity)
    func getCastDetailsFailure(error: Error)
}

class MovieDetailsPresenter: MovieDetailsPresenterInterface {
        
    var view: MovieDetailsViewInterface?
    var router: MovieDetailsRouterInterface?
    var interactor: MovieDetailsInteractorInterface?
    var movieId: Int?
    
    init(movieId: Int?) {
        self.movieId = movieId
    }
    
    func getDetails() {
        interactor?.getMovieDetails(id: movieId ?? 500)
        interactor?.getCastDetails(id: movieId ?? 500)
    }

    func getMovieDetailsSuccess(data: MovieByIDEntity) {
        convertDataToDetailsModel(data: data)
    }
    
    func getMovieDetailsFailure(error: Error) {
        view?.getMovieDetailsFailure(error: error)
    }

    func convertDataToDetailsModel(data: MovieByIDEntity) {
        let img = Constants.imgBaseUrl + data.backdropPath
        let title = data.title
        let genresList = data.genres
        var genre: String = ""
        genresList.forEach({ item in
            genre = genre + item.name + "/"
        })
        genre.removeLast()
        let voteCount = "\(data.voteCount) votes"
        let voteAverage = data.voteAverage
        let date: String = data.releaseDate.covertDate(date: data.releaseDate)
        let runtime = "\(data.runtime.description.convertMinutesToHourMinutes(minutes: data.runtime))/ \(data.runtime) min"
        let language = "\(data.spokenLanguages[0].englishName)"
        let description = data.overview
        
        let movieDetails = MovieTVDetailsModel(image: img, title: title, genre: genre, voteCount: voteCount, voteAvg: voteAverage, date: date, description: description, runtime: runtime, language: language, episodes: nil, seasons: nil)
        view?.getMovieDetailsSuccess(movieDetails: movieDetails)
    }
    
    func getCastDetailsSuccess(data: CastEntity) {
        let castDetails = data.cast.compactMap({ CellDataObject(title: $0.name, posterPath: $0.profilePath ?? "")})
        view?.getCastsSuccess(castsData: castDetails)
    }
    
    func getCastDetailsFailure(error: Error) {
        view?.getCastsFailure(error: error)
    }
    
}
