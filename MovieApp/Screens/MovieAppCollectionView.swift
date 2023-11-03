//
//  MovieAppCollectionView.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 30/10/23.
//

import Foundation
import UIKit

struct CellDataObject {
    let title: String
    let posterPath: String
}

class MovieAppCollectionView: UIView {
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var cellData: [CellDataObject] = []
    weak var delegate: CellActionDelegate?
    
    init(scrollDirection: UICollectionView.ScrollDirection) {
        super.init(frame: .zero)
        setupLayout(scrollDirection: scrollDirection)
        setupCollectionView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(scrollDirection: UICollectionView.ScrollDirection) {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = CGSize(width: 120, height: 200)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieAppCollectionViewCell.self, forCellWithReuseIdentifier: MovieAppCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configCellDetails(cellData: [CellDataObject]) {
        self.cellData = cellData
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension MovieAppCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieAppCollectionViewCell.identifier, for: indexPath) as? MovieAppCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCellDetails(cellData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if cellData.isEmpty { return 0 }
        return cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellClicked(indexPath: indexPath)
    }
    
}

protocol CellActionDelegate: AnyObject {
    func cellClicked(indexPath: IndexPath)
}
