//
//  CastDetailsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol CastDetailsInteractorInterface {
    var presenter: CastDetailsInteractorToPresenterInterface? { get set }
    func getCastDetails<T: Codable>(modelType: T.Type, type: EndPointAPIType)
}

class CastDetailsInteractor: CastDetailsInteractorInterface {
    var presenter: CastDetailsInteractorToPresenterInterface?
    private let castRepo: MovieAppRepositoryDelegate
    
    init(presenter: CastDetailsInteractorToPresenterInterface?, castRepo: MovieAppRepositoryDelegate = MovieAppRepository()) {
        self.presenter = presenter
        self.castRepo = castRepo
    }
        
    func getCastDetails<T: Codable>(modelType: T.Type, type: EndPointAPIType) {
        castRepo.getMovieAppData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let castData):
                presenter?.getCastDataSuccess(castData: castData)
            case .failure(let error):
                presenter?.getCastDataFailure(error: error)
            }
            
        }
    }
}
