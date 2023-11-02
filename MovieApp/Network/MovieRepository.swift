//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

protocol MovieRepositoryDelegate: AnyObject {
    func getMovieData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>)
}

class MovieRepository: MovieRepositoryDelegate {
    func getMovieData<T>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) where T: Decodable, T: Encodable {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}

//class MovieRepository {
//    
//    var eventHandler: ((_ event: Event) -> Void)?
//    var popularMovieData: MovieResult?
//    var topRatedMovieData: MovieResult?
//    var upcomingMovieData: MovieResult?
//    var nowPlayingMovieData: MovieResult?
//    var movieDetailsByIdData: MovieByIDEntity?
//    
//    func getPopularMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieResult.self, type: EndPointMovie.popularMovie) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let movie):
//                self.popularMovieData = movie
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//    
//    func getTopRatedMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieResult.self, type: EndPointMovie.topRatedMovie) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let movie):
//                self.topRatedMovieData = movie
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//    
//    func getUpcomingMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieResult.self, type: EndPointMovie.upcomingMovie) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let movie):
//                self.upcomingMovieData = movie
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//    
//    func getNowPlayingMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieResult.self, type: EndPointMovie.nowPlayingMovie) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let movie):
//                self.nowPlayingMovieData = movie
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//    
//    func getMovieDetailsByIDData() {
//        self.eventHandler?(.loading)
//        let movieId = 343611
//        APIManager.shared.request(modelType: MovieByIDEntity.self, type: EndPointMovie.movieDetails(id: movieId)) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let movie):
//                self.movieDetailsByIdData = movie
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//
//}
//
//extension MovieRepository {
//    enum Event {
//        case loading
//        case stopLoading
//        case dataLoaded
//        case error(String)
//    }
//}
