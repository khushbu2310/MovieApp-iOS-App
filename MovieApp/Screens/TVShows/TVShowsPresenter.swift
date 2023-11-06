//
//  TVShowsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol TVShowsPresenterInterface {
    var view: TVShowsViewInterface? { get set }
    var router: TVShowsRouterInterface? { get set }
    var interactor: TVShowsInteractorInterface? { get set }
    
    var popularTVShowList: TVShowResult? { get set }
    func getPopularTVShowList()
    func getPopularTVShowSuccess(tvShow: TVShowResult)
    func getPopularTVShowFailure(error: Error)
    func navigateToTVShowDetails(indexPath: IndexPath)
}

class TVShowsPresenter: TVShowsPresenterInterface {
    
    var view: TVShowsViewInterface?
    var router: TVShowsRouterInterface?
    var interactor: TVShowsInteractorInterface?
    var popularTVShowList: TVShowResult?
    
    func getPopularTVShowList() {
        interactor?.getPopularTVShow()
    }

    func getPopularTVShowSuccess(tvShow: TVShowResult) {
        self.popularTVShowList = tvShow
        let tvShowData = tvShow.results.compactMap({ CellDataObject(title: $0.name, posterPath: $0.posterPath)})
        view?.popularTVShowSuccess(cellData: tvShowData)
    }
    
    func getPopularTVShowFailure(error: Error) {
        view?.popularTVShowFailure(error: error)
    }
        
    func navigateToTVShowDetails(indexPath: IndexPath) {
        let tvShowId = popularTVShowList?.results[indexPath.row].id
        router?.navigateToTVShowDetails(tvShowId: tvShowId)
    }

}
