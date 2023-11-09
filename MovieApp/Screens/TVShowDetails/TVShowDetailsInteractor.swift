//
//  TVShowDetailsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol TVShowDetailsInteractorInterface {
    var presenter: TVShowDetailsInteractorToPresenterInterface? { get set }
    func getTVShowData<T: Codable>(modelType: T.Type, type: EndPointAPIType)
}

class TVShowDetailsInteractor: TVShowDetailsInteractorInterface {
    
    var presenter: TVShowDetailsInteractorToPresenterInterface?
    private let tvShowRepo: MovieAppRepositoryDelegate
    
    init(presenter: TVShowDetailsInteractorToPresenterInterface?, tvShowRepo: MovieAppRepositoryDelegate = MovieAppRepository()) {
        self.presenter = presenter
        self.tvShowRepo = tvShowRepo
    }
    
    func getTVShowData<T: Codable>(modelType: T.Type, type: EndPointAPIType) {
        tvShowRepo.getMovieAppData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let tvShowDetails):
                presenter?.getTVShowDetailsSuccess(tvShowDetailsData: tvShowDetails)
            case .failure(let error):
                presenter?.getTVShowDetailsFailure(error: error)
            }
        }
    }
}
