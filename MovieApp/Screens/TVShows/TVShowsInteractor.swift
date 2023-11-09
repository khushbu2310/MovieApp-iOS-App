//
//  TVShowsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
protocol TVShowsInteractorInterface {
    var presenter: TVShowsInteractorToPresenterInterface? { get set }
    func getPopularTVShow<T: Codable>(type: EndPointAPIType, modelType: T.Type)
}

class TVShowsInteractor: TVShowsInteractorInterface {
    var presenter: TVShowsInteractorToPresenterInterface?
    private let tvShowRepo: MovieAppRepositoryDelegate
    
    init(presenter: TVShowsInteractorToPresenterInterface?, tvShowRepo: MovieAppRepositoryDelegate = MovieAppRepository()) {
        self.presenter = presenter
        self.tvShowRepo = tvShowRepo
    }
    
    func getPopularTVShow<T: Codable>(type: EndPointAPIType, modelType: T.Type) {
        tvShowRepo.getMovieAppData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let tvShow):
                presenter?.getPopularTVShowSuccess(tvShow: tvShow)
            case .failure(let error):
                presenter?.getPopularTVShowFailure(error: error)
            }
        }
    }
}
