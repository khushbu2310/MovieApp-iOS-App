//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation

protocol MovieInteractorInterface {
    var presenter: MovieInteractorToPresenterInterface? { get set }
    func getMovieData<T: Codable>(type: EndPointAPIType, modelType: T.Type )
}

class MovieInteractor: MovieInteractorInterface {
    var presenter: MovieInteractorToPresenterInterface?
    private let movieRepo: MovieAppRepositoryDelegate
        
    init(presenter: MovieInteractorToPresenterInterface?, movieRepo: MovieAppRepositoryDelegate = MovieAppRepository()) {
        self.presenter = presenter
        self.movieRepo = movieRepo
    }
    
    func getMovieData<T: Codable>(type: EndPointAPIType, modelType: T.Type) {
        movieRepo.getMovieAppData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getPopularMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getPopularMovieFailure(error: error)
            }
        }
    }
}
