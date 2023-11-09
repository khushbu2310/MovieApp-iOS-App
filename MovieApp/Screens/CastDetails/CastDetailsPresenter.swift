//
//  CastDetailsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol CastDetailsViewToPresenterInterface {
    var view: CastDetailsViewInterface? { get set }
    func getCastData()
}

protocol CastDetailsInteractorToPresenterInterface {
    var interactor: CastDetailsInteractorInterface? { get set }
    func getCastDataSuccess<T: Codable>(castData: T)
    func getCastDataFailure(error: Error)
}

protocol CastDetailsRouterToPresenterInterface {
    var router: CastDetailsRouterInterface? { get set }
}

class CastDetailsPresenter: CastDetailsViewToPresenterInterface, CastDetailsInteractorToPresenterInterface, CastDetailsRouterToPresenterInterface {
    
    var view: CastDetailsViewInterface?
    var interactor: CastDetailsInteractorInterface?
    var router: CastDetailsRouterInterface?
    var castId: Int?
    var castDetails: CastDetailsByIdEntity?
    var castCombineDetails: CastMovieTVModel?
    var castImageList: CastImagesByIdEntity?
    
    var error: DataError?
    
    init(castId: Int?) {
        self.castId = castId
    }
    
    func getCastData() {
        guard let castId = castId else { return }
        interactor?.getCastDetails(modelType: CastDetailsByIdEntity.self, type: EndPointCast.castDetailsById(id: castId))
        interactor?.getCastDetails(modelType: CastImagesByIdEntity.self, type: EndPointCast.castImagesById(id: castId))
        interactor?.getCastDetails(modelType: CastMovieTVModel.self, type: EndPointCast.knownForCombine(id: castId))
    }
    
    func getCastDataSuccess<T: Codable>(castData: T) {
        switch castData {
            
        case is CastDetailsByIdEntity:
            guard let data = castData as? CastDetailsByIdEntity else { return }
            self.castDetails = data
            view?.getCastDetailsSuccess(castDetails: data)
            
        case is CastImagesByIdEntity:
            guard let data = castData as? CastImagesByIdEntity else { return }
            self.castImageList = data
            let cellData = data.profiles.compactMap({ CellDataObject(title: "", posterPath: $0.filePath) })
            view?.getCastImagesSuccess(castDetails: cellData)
            
        case is CastMovieTVModel:
            guard let data = castData as? CastMovieTVModel else { return }
            self.castCombineDetails = data
            let cellData = data.cast.compactMap({ CellDataObject(title: $0.originalTitle ?? "", posterPath: $0.posterPath ?? "") })
            view?.getCastCombineSuccess(castDetails: cellData)
            
        default:
            break
        }
    }
    
    func getCastDataFailure(error: Error) {
        self.error = error as? DataError
        view?.getCastDataFailure(error: error)
    }
}
