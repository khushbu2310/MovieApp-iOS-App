//
//  HomeInteractor.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? { get set }
    func getPopularMovieData()
    func getNowPlayingMovieData()
    func getTopRatedMovieData()
    func getUpComingMovieData()
}

class HomeInteractor: HomeInteractorInterface {
    var presenter: HomePresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getPopularMovieData() {
        movieRepo.getMovieData(modelType: MovieResult.self, type: EndPointMovie.popularMovie) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getPopularMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getPopularMovieFailure(error: error)
            }
        }
    }
    
    func getNowPlayingMovieData() {
        movieRepo.getMovieData(modelType: MovieResult.self, type: EndPointMovie.nowPlayingMovie) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getNowPlayingMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getNowPlayingMovieFailure(error: error)
            }
        }
    }

    func getTopRatedMovieData() {
        movieRepo.getMovieData(modelType: MovieResult.self, type: EndPointMovie.topRatedMovie) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getTopRatedMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getTopRatedMovieFailure(error: error)
            }
        }
    }
    
    func getUpComingMovieData() {
        movieRepo.getMovieData(modelType: MovieResult.self, type: EndPointMovie.upcomingMovie) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getUpComingMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getUpComingMovieFailure(error: error)
            }
        }
    }
}
