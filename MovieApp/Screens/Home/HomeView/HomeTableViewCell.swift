//
//  HomeTableViewCell.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol ColletionViewInterface {
    func popularMovieSuccess(cellData: [CellDataObject])
    func topRatedMovieSuccess(cellData: [CellDataObject])
    func upComingMovieSuccess(cellData: [CellDataObject])
    func nowPlayingMovieSuccess(cellData: [CellDataObject])
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
    
    func popularMovieSuccess(cellData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData)
        }
    }
    
    func topRatedMovieSuccess(cellData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData)
        }
    }

    func upComingMovieSuccess(cellData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData)
        }
    }
    
    func nowPlayingMovieSuccess(cellData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData)
        }
    }
    
    func configContent(cellData: [CellDataObject]) {
        self.movieCollectionView.configCellDetails(cellData: cellData)
    }
}

