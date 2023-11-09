//
//  TVShowsViewController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol TVShowsViewInterface {
    var presenter: TVShowsViewToPresenterInterface? { get set }
    func popularTVShowSuccess(cellData: [CellDataObject])
    func popularTVShowFailure(error: Error)
}

class TVShowsViewController: UIViewController, TVShowsViewInterface {
    var presenter: TVShowsViewToPresenterInterface?
    
    let tvShowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tvShowCollectionView = {
        let tvShowView = MovieAppCollectionView(scrollDirection: .vertical, itemSize: CGSize(width: UIScreen.main.bounds.width/3 - 20, height: 200), cell: MovieAppCollectionViewCell.self, identifier: MovieAppCollectionViewCell.identifier)
        tvShowView.translatesAutoresizingMaskIntoConstraints = false
        tvShowView.collectionView.showsVerticalScrollIndicator = false
        return tvShowView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        setupConstraints()
        presenter?.getPopularTVShowList()
        tvShowCollectionView.delegate = self
    }

    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "TV Shows"
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tvShowView)
        tvShowView.addSubview(tvShowCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tvShowView.topAnchor.constraint(equalTo: view.topAnchor),
            tvShowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tvShowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tvShowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            tvShowCollectionView.topAnchor.constraint(equalTo: tvShowView.topAnchor),
            tvShowCollectionView.leadingAnchor.constraint(equalTo: tvShowView.leadingAnchor),
            tvShowCollectionView.trailingAnchor.constraint(equalTo: tvShowView.trailingAnchor),
            tvShowCollectionView.bottomAnchor.constraint(equalTo: tvShowView.bottomAnchor)
        ])
    }
    
    func popularTVShowSuccess(cellData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.tvShowCollectionView.configContent(dataList: cellData)
            self.tvShowCollectionView.collectionView.reloadData()
        }
    }
    
    func popularTVShowFailure(error: Error) {
        print(error)
    }
}

extension TVShowsViewController: CellActionDelegate {
    func cellClicked(indexPath: IndexPath) {
        presenter?.navigateToTVShowDetails(indexPath: indexPath)
    }
}
