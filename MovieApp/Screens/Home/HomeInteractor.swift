//
//  HomeInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

protocol HomeInteractorInterface {
    var presenter: HomeInteractorToPresenterInterface? { get set }
    func getMovieData<T: Codable>(type: EndPointAPIType, movieType: MovieTypesEnum, modelType: T.Type)
}

class HomeInteractor: HomeInteractorInterface {
    
    var presenter: HomeInteractorToPresenterInterface?
    private let movieRepo: MovieAppRepositoryDelegate
        
    init(presenter: HomeInteractorToPresenterInterface?, movieRepo: MovieAppRepositoryDelegate = MovieAppRepository()) {
        self.presenter = presenter
        self.movieRepo = movieRepo
    }
    
    func getMovieData<T: Codable>(type: EndPointAPIType, movieType: MovieTypesEnum, modelType: T.Type) {
        movieRepo.getMovieAppData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getMovieSuccess(movie: movie, enumType: movieType)
            case .failure(let error):
                presenter?.getMovieFailure(error: error)
            }
        }

    }

}
