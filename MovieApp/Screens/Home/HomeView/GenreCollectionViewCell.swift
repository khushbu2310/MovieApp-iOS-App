//
//  GenreCollectionViewCell.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 01/11/23.
//

import Foundation
import UIKit

protocol GenreCollectionInterface {
    func didTapGenreBtn(_ index: Int)
}

class GenreCollectionViewCell: UICollectionViewCell {

    static let identifier = GenreCollectionViewCell.description()
    var genreDelegate: GenreCollectionInterface?
    
    let genreButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Button", for: .normal)
        btn.titleLabel?.font = .interLight(size: 15)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        genreButton.addTarget(self, action: #selector(genreButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.addSubview(genreButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            genreButton.heightAnchor.constraint(equalToConstant: 30),
            genreButton.topAnchor.constraint(equalTo: self.topAnchor),
            genreButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            genreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            genreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc func genreButtonTapped() {
        genreDelegate?.didTapGenreBtn(genreButton.tag)
        if genreButton.isHighlighted {
            genreButton.backgroundColor = .red
        }
    }
    
    func configGenreType(data: Genres?) {
        genreButton.setTitle(data?.name, for: .normal)
    }
}
