//
//  MovieDetailsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation

protocol MovieDetailsInteractorInterface {
    var presenter: MovieDetailsInteractorToPresenterInterface? { get set }
    func getMovieData<T: Codable>(modelType: T.Type, type: EndPointAPIType)
}

class MovieDetailsInteractor: MovieDetailsInteractorInterface {
        
    var presenter: MovieDetailsInteractorToPresenterInterface?
    private let movieRepo: MovieAppRepositoryDelegate
    
    init(presenter: MovieDetailsInteractorToPresenterInterface?, movieRepo: MovieAppRepositoryDelegate = MovieAppRepository()) {
        self.presenter = presenter
        self.movieRepo = movieRepo
    }
    
    func getMovieData<T: Codable>(modelType: T.Type, type: EndPointAPIType) {
        movieRepo.getMovieAppData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let movieDetails):
                presenter?.getMovieDetailsSuccess(movieDetailsData: movieDetails)
            case .failure(let error):
                presenter?.getMovieDetailsFailure(error: error)
            }
        }

    }
}
