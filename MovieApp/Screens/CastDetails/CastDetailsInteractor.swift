//
//  CastDetailsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol CastDetailsInteractorInterface {
    var presenter: CastDetailsPresenterInterface? { get set }
    func getCastDetails(id: Int)
    func getCastImages(id: Int)
    func getCastCombine(id: Int)
}

class CastDetailsInteractor: CastDetailsInteractorInterface {
    var presenter: CastDetailsPresenterInterface?
    private let castRepo: CastRepositoryDelegate
    
    init(castRepo: CastRepositoryDelegate = CastRepository()) {
        self.castRepo = castRepo
    }
    
    func getCastDetails(id: Int) {
        castRepo.getCastData(modelType: PersonDetailsByIdEntity.self, type: EndPointCast.personDetailsById(id: id)) { [self] response in
            switch response {
            case .success(let personDetails):
                presenter?.getPersonDetailsSuccess(data: personDetails)
            case .failure(let error):
                presenter?.getPersonDetailsFailure(error: error)
            }
        }
    }
    
    func getCastImages(id: Int) {
        castRepo.getCastData(modelType: PersonImagesByIdEntity.self, type: EndPointCast.personImagesById(id: id)) { [self] response in
            switch response {
            case .success(let personDetails):
                presenter?.getCastImagesSuccess(data: personDetails)
            case .failure(let error):
                presenter?.getCastImagesFailure(error: error)
            }
        }
    }
    
    func getCastCombine(id: Int) {
        castRepo.getCastData(modelType: CastMovieTVModel.self, type: EndPointCast.knownForCombine(id: id)) { [self] response in
            switch response {
            case .success(let personDetails):
                presenter?.getCastCombineSuccess(data: personDetails)
            case .failure(let error):
                presenter?.getCastCombineFailure(error: error)
            }
        }

    }
}
