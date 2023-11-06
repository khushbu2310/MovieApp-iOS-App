//
//  TVShowDetailsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation

protocol TVShowDetailsInteractorInterface {
    var presenter: TVShowDetailsPresenterInterface? { get set }
    func getTVShowDetails(id: Int)
    func getCastDetails(id: Int)
    func getTvShowVideos(id: Int)
}

class TVShowDetailsInteractor: TVShowDetailsInteractorInterface {
    var presenter: TVShowDetailsPresenterInterface?
    private let tvShowRepo: TVShowRepositoryDelegate
    private let castRepo: CastRepositoryDelegate
    
    init(tvShowRepo: TVShowRepositoryDelegate = TVShowRepository(), castRepo: CastRepositoryDelegate = CastRepository()) {
        self.tvShowRepo = tvShowRepo
        self.castRepo = castRepo
    }
    
    func getTVShowDetails(id: Int) {
        tvShowRepo.getTVShowData(modelType: TVShowByIDEntity.self, type: EndPointTVShow.tvShowDetails(id: id)) { [self] response in
            switch response {
            case .success(let tvShowDetails):
                presenter?.getTVShowDetailsSuccess(data: tvShowDetails)
            case .failure(let error):
                presenter?.getTVShowDetailsFailure(error: error)
                
            }
        }
    }
    
    func getCastDetails(id: Int) {
        castRepo.getCastData(modelType: CastEntity.self, type: EndPointCast.tvShowsCastList(id: id)) { [self] response in
            switch response {
            case .success(let castDetails):
                presenter?.getCastDetailsSuccess(data: castDetails)
            case .failure(let error):
                presenter?.getCastDetailsFailure(error: error)
            }
        }
    }
    
    func getTvShowVideos(id: Int) {
        tvShowRepo.getTVShowData(modelType: VideoModel.self, type: EndPointTVShow.tvShowVideDetails(id: id)) { [self] response in
            switch response {
            case .success(let movieDetails):
                presenter?.getVideosSuccess(data: movieDetails)
            case .failure(let error):
                presenter?.getVideosFailure(error: error)
            }
        }
    }
}
