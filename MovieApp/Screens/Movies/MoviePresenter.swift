//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol MoviePresenterInterface {
    var view: MovieViewInterface? { get set }
    var router: MovieRouterInterface? { get set }
    var interactor: MovieInteractorInterface? { get set }
    
    var popularMovieList: MovieResult? { get set }
    func getPopularMovieList()
    func getPopularMovieSuccess(movie: MovieResult)
    func getPopularMovieFailure(error: Error)
    func setCollectionCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func setCollectionViewCellCount(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    
    func gotoMovieDetails(id: Int)
}

protocol MoviePresenterToView {
    var presenter: MoviePresenter { get set }
}

class MoviePresenter: MoviePresenterInterface {
        
    var view: MovieViewInterface?
    var router: MovieRouterInterface?
    var interactor: MovieInteractorInterface?
    var popularMovieList: MovieResult?
    
    func getPopularMovieList() {
        interactor?.getPopularMovieData()
    }
    
    func getPopularMovieSuccess(movie: MovieResult) {
        self.popularMovieList = movie
        view?.popularMovieSuccess(cellData: movie.ToCellObj())
    }
    
    func getPopularMovieFailure(error: Error) {
        view?.popularMovieFailure(error: error)
    }
    
    func setCollectionCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieAppCollectionViewCell.identifier, for: indexPath) as? MovieAppCollectionViewCell else { return UICollectionViewCell() }
        let title = popularMovieList?.results[indexPath.row].originalTitle ?? "Movie Name"
        let posterPath = popularMovieList?.results[indexPath.row].posterPath ?? ""
        cell.configureCellDetails(title: title, posterPath: posterPath)
        return cell
    }
    
    func setCollectionViewCellCount(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        popularMovieList?.results.count ?? 10
    }
    
    func gotoMovieDetails(id: Int) {
        //router call
    }
}
