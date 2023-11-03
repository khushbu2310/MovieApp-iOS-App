//
//  MovieAppCollectionViewCell.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 30/10/23.
//

import Foundation
import UIKit

class MovieAppCollectionViewCell: UICollectionViewCell {
    static let identifier = MovieAppCollectionViewCell.description()
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let movieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .interMedium(size: 15)
        label.text = "Movie Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(movieImage)
        self.addSubview(movieLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 160),
            movieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            movieImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            movieLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            movieLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configureCellDetails(_ data: CellDataObject) {
        let imagePath = Constants.imgBaseUrl + data.posterPath
        movieImage.setImage(with: imagePath)
        movieLabel.text = data.title
    }
}
