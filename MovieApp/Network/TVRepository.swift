//
//  TVRepository.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation

protocol TVShowRepositoryDelegate: AnyObject {
    func getTVShowData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>)
}

class TVShowRepository: TVShowRepositoryDelegate {
    func getTVShowData<T>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) where T: Decodable, T: Encodable {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}


//class TVRepository {
//    
//    var eventHandler: ((_ event: Event) -> Void)?
//    var popularTVData: TVShowResult?
//    var topRatedTVData: TVShowResult?
//    var tvShowDetailsByIdData: TVShowByIDEntity?
//    
//    func getPopularMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: TVShowResult.self, type: EndPointTVShow.popularTVShows) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let tvShow):
//                self.popularTVData = tvShow
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//    
//    func getTopRatedMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: TVShowResult.self, type: EndPointTVShow.topRatedTVShows) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let tvShow):
//                self.topRatedTVData = tvShow
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//    
//    func getMovieDetailsByIDData() {
//        self.eventHandler?(.loading)
//        let tvShowId = 233643
//        APIManager.shared.request(modelType: TVShowByIDEntity.self, type: EndPointTVShow.tvShowDetails(id: tvShowId)) { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let tvShow):
//                self.tvShowDetailsByIdData = tvShow
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                self.eventHandler?(.error(error.localizedDescription))
//            }
//        }
//    }
//
//}
//
//extension TVRepository {
//    enum Event {
//        case loading
//        case stopLoading
//        case dataLoaded
//        case error(String)
//    }
//}
