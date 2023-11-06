//
//  CastDetailsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol CastDetailsPresenterInterface {
    var view: CastDetailsViewInterface? { get set }
    var interactor: CastDetailsInteractorInterface? { get set }
    var router: CastDetailsRouterInterface? { get set }
    
    func getDetails()
  
    func getPersonDetailsSuccess(data: PersonDetailsByIdEntity)
    func getPersonDetailsFailure(error: Error)
    
    func getCastImagesSuccess(data: PersonImagesByIdEntity)
    func getCastImagesFailure(error: Error)
    
    func getCastCombineSuccess(data: CastMovieTVModel)
    func getCastCombineFailure(error: Error)

}

class CastDetailsPresenter: CastDetailsPresenterInterface {
    
    var view: CastDetailsViewInterface?
    var interactor: CastDetailsInteractorInterface?
    var router: CastDetailsRouterInterface?
    var castId: Int?
    
    init(castId: Int?) {
        self.castId = castId
    }
    
    func getDetails() {
        interactor?.getCastDetails(id: castId ?? 500)
        interactor?.getCastImages(id: castId ?? 500)
        interactor?.getCastCombine(id: castId ?? 500)
    }
    
    func getPersonDetailsSuccess(data: PersonDetailsByIdEntity) {
        view?.getPersonDetailsSuccess(castDetails: data)
    }
    
    func getPersonDetailsFailure(error: Error) {
        view?.getPersonDetailsFailure(error: error)
    }
    
    func getCastImagesSuccess(data: PersonImagesByIdEntity) {
        let castData = data.profiles.compactMap({ CellDataObject(title: "", posterPath: $0.filePath)})
        view?.getCastImagesSuccess(castDetails: castData)
    }
    
    func getCastImagesFailure(error: Error) {
        view?.getCastImagesFailure(error: error)
    }
    
    func getCastCombineSuccess(data: CastMovieTVModel) {
        let castData = data.cast.compactMap({ CellDataObject(title: $0.originalTitle ?? "", posterPath: $0.posterPath ?? "")})
        view?.getCastCombineSuccess(castDetails: castData)
    }
    
    func getCastCombineFailure(error: Error) {
        view?.getCastCombineFailure(error: error)
    }
}
