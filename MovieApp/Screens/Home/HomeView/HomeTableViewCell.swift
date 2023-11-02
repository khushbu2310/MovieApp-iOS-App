//
//  HomeTableViewCell.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol ColletionViewInterface {
    func popularMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol)
    func topRatedMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol)
    func upComingMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol)
    func nowPlayingMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol)
}

protocol CellActionProtocol {
    func cellClicked()
}
class HomeTableViewCell: UITableViewCell, ColletionViewInterface {
    static let identifier = HomeTableViewCell.description()
    var popularMovieList: MovieResult?
    var presenter: HomePresenterInterface?
    
    let movieCollectionView: MovieAppCollectionView = {
        let movieView = MovieAppCollectionView(scrollDirection: .horizontal)
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.collectionView.showsVerticalScrollIndicator = false
        return movieView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupUI() {
        contentView.addSubview(movieCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func popularMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData, presenterDelegate: presenterDelegate)
        }
    }
    
    func topRatedMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData, presenterDelegate: presenterDelegate)
        }
    }

    func upComingMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData, presenterDelegate: presenterDelegate)
        }
    }
    
    func nowPlayingMovieSuccess(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData, presenterDelegate: presenterDelegate)
        }
    }
    
    func configContent(cellData: [CellDataObject], presenterDelegate: CollectionViewToHomePresenterProtocol) {
        self.movieCollectionView.configCellDetails(cellData: cellData, presenterDelegate: presenterDelegate)
    }
}

