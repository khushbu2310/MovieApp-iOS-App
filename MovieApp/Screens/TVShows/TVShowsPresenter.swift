//
//  TVShowsPresenter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol TVShowsPresenterInterface {
    var view: TVShowsViewInterface? { get set }
    var router: TVShowsRouterInterface? { get set }
    var interactor: TVShowsInteractorInterface? { get set }
    
    var popularTVShowList: TVShowResult? { get set }
    func getPopularTVShowList()
    func getPopularTVShowSuccess(tvShow: TVShowResult)
    func getPopularTVShowFailure(error: Error)
    func setCollectionCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func setCollectionViewCellCount(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
}

class TVShowsPresenter: TVShowsPresenterInterface {
    
    var view: TVShowsViewInterface?
    var router: TVShowsRouterInterface?
    var interactor: TVShowsInteractorInterface?
    var popularTVShowList: TVShowResult?
    
    func getPopularTVShowList() {
        interactor?.getPopularTVShow()
    }

    func getPopularTVShowSuccess(tvShow: TVShowResult) {
        self.popularTVShowList = tvShow
        view?.popularTVShowSuccess(cellData: tvShow.ToCellObj())
    }
    
    func getPopularTVShowFailure(error: Error) {
        view?.popularTVShowFailure(error: error)
    }
    
    func setCollectionCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieAppCollectionViewCell.identifier, for: indexPath) as? MovieAppCollectionViewCell else { return UICollectionViewCell() }
        let title = popularTVShowList?.results[indexPath.row].originalName ?? "TV Show Name"
        let posterPath = popularTVShowList?.results[indexPath.row].posterPath ?? ""
        let cellData = popularTVShowList?.ToCellObj()
//        cell.configureCellDetails(popularTVShowList?.ToCellObj())
        return cell
    }
    
    func setCollectionViewCellCount(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        popularTVShowList?.results.count ?? 1
    }

}
