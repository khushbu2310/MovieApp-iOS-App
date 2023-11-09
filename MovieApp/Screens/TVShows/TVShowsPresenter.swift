//
//  TVShowsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol TVShowsViewToPresenterInterface {
    var view: TVShowsViewInterface? { get set }
    func getPopularTVShowList()
    func navigateToTVShowDetails(indexPath: IndexPath)
}

protocol TVShowsInteractorToPresenterInterface {
    var interactor: TVShowsInteractorInterface? { get set }
    var popularTVShowList: TVShowResult? { get set }
    func getPopularTVShowSuccess<T: Codable>(tvShow: T)
    func getPopularTVShowFailure(error: Error)
}

protocol TVShowsRouterToPresenterInterface {
    var router: TVShowsRouterInterface? { get set }
}

class TVShowsPresenter: TVShowsViewToPresenterInterface, TVShowsInteractorToPresenterInterface, TVShowsRouterToPresenterInterface {
    
    var view: TVShowsViewInterface?
    var router: TVShowsRouterInterface?
    var interactor: TVShowsInteractorInterface?
    var popularTVShowList: TVShowResult?
    var error: DataError?
    
    func getPopularTVShowList() {
        interactor?.getPopularTVShow(type: EndPointTVShow.popularTVShows, modelType: TVShowResult.self)
    }

    func getPopularTVShowSuccess<T: Codable>(tvShow: T) {
        guard let tvShow = tvShow as? TVShowResult else { return }
        self.popularTVShowList = tvShow
        let tvShowData = tvShow.results.compactMap({ CellDataObject(title: $0.name, posterPath: $0.posterPath)})
        view?.popularTVShowSuccess(cellData: tvShowData)
    }
    
    func getPopularTVShowFailure(error: Error) {
        self.error = error as? DataError
        view?.popularTVShowFailure(error: error)
    }
        
    func navigateToTVShowDetails(indexPath: IndexPath) {
        let tvShowId = popularTVShowList?.results[indexPath.row].id
        router?.navigateToTVShowDetails(tvShowId: tvShowId)
    }

}
