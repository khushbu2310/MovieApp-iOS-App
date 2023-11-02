//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol MovieViewInterface {
    var presenter: MoviePresenterInterface? { get set }
    func popularMovieSuccess(cellData: [CellDataObject])
    func popularMovieFailure(error: Error)
}

class MovieViewController: UIViewController, MovieViewInterface {
    var presenter: MoviePresenterInterface?
    var popularMovieListData: MovieResult?
    
    let movieView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let movieCollectionView = {
        let movieView = MovieAppCollectionView(scrollDirection: .vertical)
        movieView.translatesAutoresizingMaskIntoConstraints = false
        movieView.collectionView.showsVerticalScrollIndicator = false
        return movieView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTitle()
        setupConstraints()
        presenter?.getPopularMovieList()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(movieView)
        movieView.addSubview(movieCollectionView)
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Movies"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieView.topAnchor.constraint(equalTo: view.topAnchor),
            movieView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            movieCollectionView.topAnchor.constraint(equalTo: movieView.topAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: movieView.trailingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: movieView.bottomAnchor)
        ])
    }
    
    func popularMovieSuccess(cellData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.movieCollectionView.configCellDetails(cellData: cellData)
            self.movieCollectionView.collectionView.reloadData()
        }
    }
    
    func popularMovieFailure(error: Error) {
        print(error)
    }
}

extension MovieViewController: CellActionProtocol {
    func cellClicked() {
        presenter?.gotoMovieDetails(id: 500)
    }
}
