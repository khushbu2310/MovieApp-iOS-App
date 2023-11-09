//
//  MovieAppCollectionView.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 30/10/23.
//

import Foundation
import UIKit

class MovieAppCollectionView: UIView {
    
    var collectionView: UICollectionView!
    weak var delegate: CellActionDelegate?
    var dataList: [Codable] = []
    var identifier: String
    
    init(scrollDirection: UICollectionView.ScrollDirection, itemSize: CGSize, cell: UICollectionViewCell.Type, identifier: String) {
        self.identifier = identifier
        super.init(frame: .zero)
        setupLayout(scrollDirection: scrollDirection, itemSize: itemSize, cell: cell, identifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(scrollDirection: UICollectionView.ScrollDirection, itemSize: CGSize, cell: UICollectionViewCell.Type, identifier: String) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = itemSize
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell, forCellWithReuseIdentifier: identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
        
    func configContent(dataList: [Codable]) {
        self.dataList = dataList
    }
}

extension MovieAppCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        switch cell {
            
        case is MovieAppCollectionViewCell:
            guard let cell = cell as? MovieAppCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCellDetails(dataList[indexPath.row])
            return cell
            
        case is YoutubeCollectionViewCell:
            guard let cell = cell as? YoutubeCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCellDetails(dataList[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellClicked(indexPath: indexPath)
    }
    
}

protocol CellActionDelegate: AnyObject {
    func cellClicked(indexPath: IndexPath)
}
