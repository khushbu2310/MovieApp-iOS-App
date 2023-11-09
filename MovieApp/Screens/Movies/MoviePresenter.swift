//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol MovieViewToPresenterInterface {
    var view: MovieViewInterface? { get set }
    func getMovieList()
    func configureMovies(data: MovieResult?, type: String)
    func navigateToMovieDetails(indexPath: IndexPath)
}

protocol MovieInteractorToPresenterInterface {
    var interactor: MovieInteractorInterface? { get set }
    var movieList: MovieResult? { get set }
    func getPopularMovieSuccess<T: Codable>(movie: T)
    func getPopularMovieFailure(error: Error)
}

protocol MovieRouterToPresenterInterface {
    var router: MovieRouterInterface? { get set }
}

class MoviePresenter: MovieViewToPresenterInterface, MovieInteractorToPresenterInterface, MovieRouterToPresenterInterface {
    
    var view: MovieViewInterface?
    var router: MovieRouterInterface?
    var interactor: MovieInteractorInterface?
    var movieList: MovieResult?
    var error: DataError?
    
    func getMovieList() {
        interactor?.getMovieData(type: EndPointMovie.popularMovie, modelType: MovieResult.self)
    }
    
    func getPopularMovieSuccess<T: Codable>(movie: T) {
        guard let movie = movie as? MovieResult else { return }
        self.movieList = movie
        let movieCellData = movie.results.compactMap({ CellDataObject(title: $0.originalTitle, posterPath: $0.posterPath)})
        view?.popularMovieSuccess(cellData: movieCellData)
    }
    
    func getPopularMovieFailure(error: Error) {
        self.error = error as? DataError
        view?.popularMovieFailure(error: error)
    }
        
    func navigateToMovieDetails(indexPath: IndexPath) {
        let movieId = movieList?.results[indexPath.row].id
        router?.navigateToMovieDetails(movieId: movieId)
    }
    
    func configureMovies(data: MovieResult?, type: String) {
        self.movieList = data
        guard let movieCellData = data?.results.compactMap({ CellDataObject(title: $0.originalTitle, posterPath: $0.posterPath) }) else { return }
        view?.popularMovieSuccess(cellData: movieCellData)
    }
    
}
