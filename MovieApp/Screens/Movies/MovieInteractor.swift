//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation

protocol MovieInteractorInterface {
    var presenter: MoviePresenterInterface? { get set }
    func getPopularMovieData()
}

class MovieInteractor: MovieInteractorInterface {
    var presenter: MoviePresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    
    init(moviRepo: MovieRepositoryDelegate = MovieRepository()) {
        self.movieRepo = moviRepo
    }
    
    func getPopularMovieData() {
        movieRepo.getMovieData(modelType: MovieResult.self, type: EndPointMovie.popularMovie) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getPopularMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getPopularMovieFailure(error: error)
            }
        }
    }
}
