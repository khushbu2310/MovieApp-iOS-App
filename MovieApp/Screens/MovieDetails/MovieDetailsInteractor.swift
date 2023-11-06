//
//  MovieDetailsInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation

protocol MovieDetailsInteractorInterface {
    var presenter: MovieDetailsPresenterInterface? { get set }
    func getMovieDetails(id: Int)
    func getCastDetails(id: Int)
    func getMovieVideos(id: Int)
}

class MovieDetailsInteractor: MovieDetailsInteractorInterface {
        
    var presenter: MovieDetailsPresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    private let castRepo: CastRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository(), castRepo: CastRepositoryDelegate = CastRepository()) {
        self.movieRepo = movieRepo
        self.castRepo = castRepo
    }
    
    func getMovieDetails(id: Int) {
        movieRepo.getMovieData(modelType: MovieByIDEntity.self, type: EndPointMovie.movieDetails(id: id)) { [self] response in
            switch response {
            case .success(let movieDetails):
                presenter?.getMovieDetailsSuccess(data: movieDetails)
            case .failure(let error):
                presenter?.getMovieDetailsFailure(error: error)
            }
        }
    }
    
    func getCastDetails(id: Int) {
        castRepo.getCastData(modelType: CastEntity.self, type: EndPointCast.moviesCastList(id: id)) { [self] response in
            switch response {
            case .success(let castDetails):
                presenter?.getCastDetailsSuccess(data: castDetails)
            case .failure(let error):
                presenter?.getCastDetailsFailure(error: error)
            }
        }
    }
    
    func getMovieVideos(id: Int) {
        movieRepo.getMovieData(modelType: VideoModel.self, type: EndPointMovie.movieVideoDetails(id: id)) { [self] response in
            switch response {
            case .success(let movieDetails):
                presenter?.getVideosSuccess(data: movieDetails)
            case .failure(let error):
                presenter?.getVideosFailure(error: error)
            }
        }
    }
}
