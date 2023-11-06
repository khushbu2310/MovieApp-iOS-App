//
//  HomeInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? { get set }
    func getMovieData(type: EndPointAPIType, movieType: MovieTypesEnum)
}

class HomeInteractor: HomeInteractorInterface {
    
    var presenter: HomePresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieData(type: EndPointAPIType, movieType: MovieTypesEnum) {
        movieRepo.getMovieData(modelType: MovieResult.self, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getMovieSuccess(movie: movie, enumType: movieType)
            case .failure(let error):
                presenter?.getMovieFailure(error: error)
            }
        }

    }

}
