//
//  HomePresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation
import UIKit

protocol HomePresenterInterface {
    var view: HomeViewInterface? { get set }
    var router: HomeRouterInterface? { get set }
    var interactor: HomeInteractorInterface? { get set }
    
    func getMoviesData()
    func getMovieList(movieType: MovieTypesEnum)
    func getMovieSuccess(movie: MovieResult, enumType: MovieTypesEnum)
    func getMovieFailure(error: Error)
    
    var responseMovieList: [ResponseModel] { get set }
    var filteredMovieList: [ResponseModel] { get set }
    var genreTypeList: [Genres] { get }
    var headerTitle: [String] { get set }
    
    func setupHeaderConfig()
    func numberOfSection() -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func showAllBtnTapped(index: Int)
}

class HomePresenter: HomePresenterInterface, GenreCollectionInterface {
    var view: HomeViewInterface?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    
    var responseMovieList: [ResponseModel] = []
    var filteredMovieList: [ResponseModel] = []
    var genreTypeList = [Genres(id: 1, name: "All"), Genres(id: 28, name: "Action"), Genres(id: 35, name: "Comedy"), Genres(id: 80, name: "Crime"), Genres(id: 27, name: "Horror")]
    var headerTitle: [String] = ["Popular", "In Theaters", "Upcoming", "Top Rated"]

    func getMoviesData() {
        getMovieList(movieType: .popular)
        getMovieList(movieType: .nowplaying)
        getMovieList(movieType: .upcoming)
        getMovieList(movieType: .toprated)
    }
    
    func getMovieList(movieType: MovieTypesEnum) {
        switch movieType {
        case .popular:
            interactor?.getMovieData(type: EndPointMovie.popularMovie, movieType: movieType)
        case .nowplaying:
            interactor?.getMovieData(type: EndPointMovie.nowPlayingMovie, movieType: movieType)
        case .toprated:
            interactor?.getMovieData(type: EndPointMovie.topRatedMovie, movieType: movieType)
        case .upcoming:
            interactor?.getMovieData(type: EndPointMovie.upcomingMovie, movieType: movieType)
        }
    }
    
    func getMovieSuccess(movie: MovieResult, enumType: MovieTypesEnum) {
        responseMovieList.append(ResponseModel(responseEnum: enumType, data: movie))
        filteredMovieList.append(ResponseModel(responseEnum: enumType, data: movie))
        view?.getMovieDataSuccess()
        if enumType == .popular {
            setupHeaderConfig()
        }
    }
    
    func getMovieFailure(error: Error) {
        view?.getMovieDataFailure(error: error)
    }
        
    func setupHeaderConfig() {
        let randomNum = Int.random(in: 0...19)
        let movie = responseMovieList[0].data.results[randomNum]
        view?.setupHeaderData(lable: movie.originalTitle, voteCount: "\(movie.voteCount) votes", image: Constants.imgBaseUrl + (movie.backdropPath ?? "" ), voteAvg: movie.voteAverage)
    }
    
    func numberOfSection() -> Int {
        return filteredMovieList.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.movieCollectionView.collectionView.tag = indexPath.section
        let data = filteredMovieList[indexPath.section].data
        var cellData: [CellDataObject] = []
        data.results.forEach({ item in
            let model = CellDataObject(title: item.originalTitle, posterPath: item.posterPath)
            cellData.append(model)
        })
        cell?.movieCollectionView.configContent(dataList: cellData)
        cell?.movieCollectionView.collectionView.reloadData()
        return cell ?? UITableViewCell()
    }
    
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell
        cell?.genreDelegate = self
        cell?.genreButton.tag = indexPath.row
        cell?.configGenreType(data: genreTypeList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func showAllBtnTapped(index: Int) {
        var data: MovieResult?
        var type: String = "Movies"
        switch index {
        case 0:
            data = responseMovieList[index].data
            type = "Popular"
        case 1:
            data = responseMovieList[index].data
            type = "In Theaters"
        case 2:
            data = responseMovieList[index].data
            type = "Upcoming"
        case 3:
            data = responseMovieList[index].data
            type = "Top Rated"
        default:
            break
        }
        router?.navigateToMovies(data: data, type: type)
    }
    
    func didTapGenreBtn(_ index: Int) {
        if index != 0 {
            let genreId = genreTypeList[index].id
            filteredMovieList.removeAll()
            responseMovieList.forEach { movie in
                var data = movie.data
                let genreIds = data.results.filter { $0.genreIds.contains(genreId) }
                data.results = genreIds
                filteredMovieList.append(ResponseModel(responseEnum: movie.responseEnum, data: data))
            }
        } else {
            filteredMovieList = responseMovieList
        }
        view?.reloadTableView()
    }
}
