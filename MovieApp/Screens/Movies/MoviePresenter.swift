//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol MoviePresenterInterface {
    var view: MovieViewInterface? { get set }
    var router: MovieRouterInterface? { get set }
    var interactor: MovieInteractorInterface? { get set }
    
    var movieList: MovieResult? { get set }
    func getMovieList()
    func getPopularMovieSuccess(movie: MovieResult)
    func getPopularMovieFailure(error: Error)
    func configureMovies(data: MovieResult?, type: String)
    
    func navigateToMovieDetails(indexPath: IndexPath)
}

protocol MoviePresenterToView {
    var presenter: MoviePresenter { get set }
}

class MoviePresenter: MoviePresenterInterface {
    
    var view: MovieViewInterface?
    var router: MovieRouterInterface?
    var interactor: MovieInteractorInterface?
    var movieList: MovieResult?
    
    func getMovieList() {
        interactor?.getMovieData()
    }
    
    func getPopularMovieSuccess(movie: MovieResult) {
        self.movieList = movie
        let movieCellData = movie.results.compactMap({ CellDataObject(title: $0.originalTitle, posterPath: $0.posterPath)})
        view?.popularMovieSuccess(cellData: movieCellData)
    }
    
    func getPopularMovieFailure(error: Error) {
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
