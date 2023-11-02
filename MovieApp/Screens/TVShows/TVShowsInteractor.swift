//
//  TVShowsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
protocol TVShowsInteractorInterface {
    var presenter: TVShowsPresenterInterface? { get set }
    func getPopularTVShow()
}

class TVShowsInteractor: TVShowsInteractorInterface {
    var presenter: TVShowsPresenterInterface?
    private let tvShowRepo: TVShowRepositoryDelegate
    
    init(tvShowRepo: TVShowRepositoryDelegate = TVShowRepository()) {
        self.tvShowRepo = tvShowRepo
    }
    
    func getPopularTVShow() {
        tvShowRepo.getTVShowData(modelType: TVShowResult.self, type: EndPointTVShow.popularTVShows) { [self] response in
            switch response {
            case .success(let tvShow):
                presenter?.getPopularTVShowSuccess(tvShow: tvShow)
            case .failure(let error):
                presenter?.getPopularTVShowFailure(error: error)
            }
        }
    }
}
