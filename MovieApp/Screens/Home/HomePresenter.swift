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
    
    var popularMovieList: MovieResult? { get set }
    var nowPlayingMovieList: MovieResult? { get set }
    var topRatedMovieList: MovieResult? { get set }
    var upComingMovieList: MovieResult? { get set }
    
    var genreTypeList: [Genres] { get }
    func getMovieList()
    
    func getPopularMovieSuccess(movie: MovieResult)
    func getNowPlayingMovieSuccess(movie: MovieResult)
    func getTopRatedMovieSuccess(movie: MovieResult)
    func getUpComingMovieSuccess(movie: MovieResult)
    
    func getPopularMovieFailure(error: Error)
    func getNowPlayingMovieFailure(error: Error)
    func getTopRatedMovieFailure(error: Error)
    func getUpComingMovieFailure(error: Error)
    
    func numberOfSection() -> Int
    func numberOfRows(section: Int) -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat
    func setupHeaderView(section: Int) -> UIView
    
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

class HomePresenter: HomePresenterInterface, GenreCollectionInterface {

    var view: HomeViewInterface?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    var collectionViewDelegate: ColletionViewInterface?
    
    var popularMovieList: MovieResult?
    var nowPlayingMovieList: MovieResult?
    var topRatedMovieList: MovieResult?
    var upComingMovieList: MovieResult?
    
    var popularCellData: [CellDataObject] = []
    var nowPlayingCellData: [CellDataObject] = []
    var topRatedCellData: [CellDataObject] = []
    var upComingCellData: [CellDataObject] = []
    var genreTypeList = [Genres(id: 1, name: "All"), Genres(id: 28, name: "Action"), Genres(id: 35, name: "Comedy"), Genres(id: 80, name: "Crime"), Genres(id: 27, name: "Horror")]

    
    init(view: HomeViewInterface? = nil, router: HomeRouterInterface? = nil, interactor: HomeInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getMovieList() {
        interactor?.getPopularMovieData()
        interactor?.getNowPlayingMovieData()
        interactor?.getTopRatedMovieData()
        interactor?.getUpComingMovieData()
    }
    
    func getPopularMovieSuccess(movie: MovieResult) {
        self.popularMovieList = movie
        popularCellData = movie.ToCellObj()
        collectionViewDelegate?.popularMovieSuccess(cellData: popularCellData)
        view?.reloadTableView()
    }
        
    func getTopRatedMovieSuccess(movie: MovieResult) {
        self.topRatedMovieList = movie
        topRatedCellData = movie.ToCellObj()
        collectionViewDelegate?.topRatedMovieSuccess(cellData: topRatedCellData)
        view?.reloadTableView()
    }
    
    func getUpComingMovieSuccess(movie: MovieResult) {
        self.upComingMovieList = movie
        upComingCellData = movie.ToCellObj()
        collectionViewDelegate?.upComingMovieSuccess(cellData: upComingCellData)
        view?.reloadTableView()
    }
    
    func getNowPlayingMovieSuccess(movie: MovieResult) {
        self.nowPlayingMovieList = movie
        nowPlayingCellData = movie.ToCellObj()
        collectionViewDelegate?.nowPlayingMovieSuccess(cellData: nowPlayingCellData)
        view?.reloadTableView()
    }
    
    func getPopularMovieFailure(error: Error) {
        view?.popularMovieFailure(error: error)
    }
    
    func getNowPlayingMovieFailure(error: Error) {
        view?.nowPlayingMovieFailure(error: error)
    }
    
    func getTopRatedMovieFailure(error: Error) {
        view?.topRatedMovieFailure(error: error)
    }
    
    func getUpComingMovieFailure(error: Error) {
        view?.upComingMovieFailure(error: error)
    }
    
    // Table View delegate and datasource
    func numberOfSection() -> Int {
        return 4
    }
    
    func numberOfRows(section: Int) -> Int {
        return 1
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.movieCollectionView.tag = indexPath.section
        switch indexPath.section {
        case 0: cell.configContent(cellData: popularCellData)
        case 1: cell.configContent(cellData: topRatedCellData)
        case 2: cell.configContent(cellData: upComingCellData)
        case 3: cell.configContent(cellData: nowPlayingCellData)
        default: break
        }
        
        return cell
    }
    
    func heightForRowAt(tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func heightForSectionAt(tableView: UITableView, section: Int) -> CGFloat {
        return 30
    }
    
    func setupHeaderView(section: Int) -> UIView {
        
        let header = SectionHeaderView()
        switch section {
        case 0: header.configHeaderContent(sectionTitle: "Popular", section: section)
        case 1: header.configHeaderContent(sectionTitle: "Top Rated", section: section)
        case 2: header.configHeaderContent(sectionTitle: "Upcoming", section: section)
        case 3: header.configHeaderContent(sectionTitle: "In Theaters", section: section)
        default: break
        }
        return header
    }
    
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell
        cell?.genreButton.tag = indexPath.row
        cell?.configGenreType(data: genreTypeList[indexPath.row])
        cell?.genreDelegate = self
        return cell ?? UICollectionViewCell()
    }
    
    func didTapGenreBtn(_ index: Int) {
        if index != 0 {
            let genreId = genreTypeList[index].id
            print("Genre id: \(genreTypeList[index].id) and name: \(genreTypeList[index].name)")
        }
    }
        
}
