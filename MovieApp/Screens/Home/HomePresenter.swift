//
//  HomePresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation
import UIKit

protocol HomeViewToPresenterInterface {
    var view: HomeViewInterface? { get set }
    var genreTypeList: [Genres] { get }
    var numberOfSections: Int? { get }

    func getMoviesData()
    func configHeaderTitle(index: Int) -> String
    func configMovieDetails(index: Int) -> [CellDataObject]?
    func setupHeaderConfig()
    func didTapGenreBtn(_ index: Int)
    func showAllBtnTapped(index: Int)
}

protocol HomeInteractorToPresenterInterface {
    var interactor: HomeInteractorInterface? { get set }
    func getMovieSuccess<T: Codable>(movie: T, enumType: MovieTypesEnum)
    func getMovieFailure(error: Error)
}

protocol HomeRouterToPresenterInterface {
    var router: HomeRouterInterface? { get set }
}

class HomePresenter: HomeViewToPresenterInterface, HomeInteractorToPresenterInterface, HomeRouterToPresenterInterface, GenreCollectionInterface {
    var view: HomeViewInterface?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    
    var responseMovieList: [ResponseModel] = []
    var filteredMovieList: [ResponseModel] = []
    var error: DataError?
    var genreTypeList = [Genres(id: 1, name: "All"), Genres(id: 28, name: "Action"), Genres(id: 35, name: "Comedy"), Genres(id: 80, name: "Crime"), Genres(id: 27, name: "Horror")]
    var numberOfSections: Int? { return filteredMovieList.count }
    
    func getMoviesData() {
        interactor?.getMovieData(type: EndPointMovie.popularMovie, movieType: .popular, modelType: MovieResult.self)
        interactor?.getMovieData(type: EndPointMovie.nowPlayingMovie, movieType: .nowplaying, modelType: MovieResult.self)
        interactor?.getMovieData(type: EndPointMovie.topRatedMovie, movieType: .toprated, modelType: MovieResult.self)
        interactor?.getMovieData(type: EndPointMovie.upcomingMovie, movieType: .upcoming, modelType: MovieResult.self)
    }
    
    func getMovieSuccess<T: Codable>(movie: T, enumType: MovieTypesEnum) {
        guard let movie = movie as? MovieResult else { return }
        responseMovieList.append(ResponseModel(responseType: enumType, data: movie))
        filteredMovieList.append(ResponseModel(responseType: enumType, data: movie))
        view?.getMovieDataSuccess()
        if enumType == .popular {
            setupHeaderConfig()
        }
    }
    
    func getMovieFailure(error: Error) {
        self.error = error as? DataError
        view?.getMovieDataFailure(error: error)
    }
        
    func configHeaderTitle(index: Int) -> String {
        switch filteredMovieList[index].responseType {
        case .popular:
            return "Popular"
        case .nowplaying:
            return "In Theaters"
        case .upcoming:
            return "Upcoming"
        case .toprated:
            return "Top rated"
        }
    }
    
    func configMovieDetails(index: Int) -> [CellDataObject]? {
        var collectionViewData: [CellDataObject] = []
        let movieData = filteredMovieList[index].data
        movieData.results.forEach({ result in
            let cellData = CellDataObject(title: result.originalTitle, posterPath: result.posterPath)
            collectionViewData.append(cellData)
        })
        return collectionViewData
    }
    func setupHeaderConfig() {
        let randomNum = Int.random(in: 0...19)
        let movie = responseMovieList[0].data.results[randomNum]
        view?.setupHeaderData(lable: movie.originalTitle, voteCount: "\(movie.voteCount) votes", image: Constants.imgBaseUrl + (movie.backdropPath ?? "" ), voteAvg: movie.voteAverage)
    }
        
    func didTapGenreBtn(_ index: Int) {
        if index != 0 {
            let genreId = genreTypeList[index].id
            filteredMovieList.removeAll()
            responseMovieList.forEach { movie in
                var data = movie.data
                let genreIds = data.results.filter { $0.genreIds.contains(genreId) }
                data.results = genreIds
                filteredMovieList.append(ResponseModel(responseType: movie.responseType, data: data))
            }
        } else {
            filteredMovieList = responseMovieList
        }
        view?.reloadTableView()
    }
    
    func showAllBtnTapped(index: Int) {
        let movieTypes = ["Popular", "In Theaters", "Upcoming", "Top Rated"]
        let data = responseMovieList[index].data
        let type = movieTypes[index]
        router?.navigateToMovies(data: data, type: type)
    }

}
