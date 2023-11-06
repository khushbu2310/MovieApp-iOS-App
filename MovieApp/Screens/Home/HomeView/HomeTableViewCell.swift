//
//  HomeTableViewCell.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = HomeTableViewCell.description()
    var movieList: [MovieResult]? = []
    
    var movieCollectionView: MovieAppCollectionView = {
        let movieView = MovieAppCollectionView(scrollDirection: .horizontal, itemSize: CGSize(width: 120, height: 200), cell: MovieAppCollectionViewCell.self, identifier: MovieAppCollectionViewCell.identifier)
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.collectionView.showsVerticalScrollIndicator = false
        return movieView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        setupConstraints()
    }
        
    func setupUI() {
        self.addSubview(movieCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

