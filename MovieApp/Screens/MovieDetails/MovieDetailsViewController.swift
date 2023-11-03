//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation
import UIKit

protocol MovieDetailsViewInterface {
    var presenter: MovieDetailsPresenterInterface? { get set }
    func getMovieDetailsSuccess(movieDetails: MovieTVDetailsModel)
    func getMovieDetailsFailure(error: Error)
    
    func getCastsSuccess(castsData: [CellDataObject])
    func getCastsFailure(error: Error)
}

protocol MovieDetailsToViewInterface: AnyObject {
    func configureMovieDetails(movieDetails: MovieTVDetailsModel)
}

class MovieDetailsViewController: UIViewController, MovieDetailsViewInterface {
    
    var presenter: MovieDetailsPresenterInterface?
    var delegate: MovieDetailsToViewInterface?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let headerDetails: UIView = {
        let movieDetailsView = MovieAppDetailsView()
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        return movieDetailsView
    }()
    
    private let videoLabel: UILabel = {
        let videoLabel = UILabel()
        videoLabel.translatesAutoresizingMaskIntoConstraints = false
        videoLabel.text = "VIDEOS"
        videoLabel.font = .interMedium(size: 20)
        return videoLabel
    }()
    
    private let castLabel: UILabel = {
        let castLabel = UILabel()
        castLabel.translatesAutoresizingMaskIntoConstraints = false
        castLabel.text = "CAST"
        castLabel.font = .interMedium(size: 20)
        return castLabel
    }()
    
    private var videoCollectionView: MovieAppCollectionView = {
        let videos = MovieAppCollectionView(scrollDirection: .horizontal)
        videos.translatesAutoresizingMaskIntoConstraints = false
        videos.collectionView.showsHorizontalScrollIndicator = false
        return videos
    }()
    
    private var castCollectionView: MovieAppCollectionView = {
        let casts = MovieAppCollectionView(scrollDirection: .horizontal)
        casts.translatesAutoresizingMaskIntoConstraints = false
        casts.collectionView.showsHorizontalScrollIndicator = false
        return casts
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetails()
        delegate = headerDetails as? MovieDetailsToViewInterface
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerDetails)
        contentView.addSubview(videoLabel)
        contentView.addSubview(videoCollectionView)
        contentView.addSubview(castLabel)
        contentView.addSubview(castCollectionView)
    }
    
    func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupHeaderDetailsConstraints()
        setupVideoConstraints()
        setupCastConstraints()
    }
    
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.25),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func setupHeaderDetailsConstraints() {
        NSLayoutConstraint.activate([
            headerDetails.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerDetails.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    func setupVideoConstraints() {
        NSLayoutConstraint.activate([
            videoLabel.topAnchor.constraint(equalTo: headerDetails.bottomAnchor, constant: 10),
            videoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoCollectionView.topAnchor.constraint(equalTo: videoLabel.bottomAnchor, constant: 5),
            videoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupCastConstraints() {
        NSLayoutConstraint.activate([
            castLabel.topAnchor.constraint(equalTo: videoCollectionView.bottomAnchor, constant: 10),
            castLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            castLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            castCollectionView.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 5),
            castCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            castCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])

    }
    
    func getMovieDetailsSuccess(movieDetails: MovieTVDetailsModel) {
        DispatchQueue.main.async {
            self.title = movieDetails.title
            self.delegate?.configureMovieDetails(movieDetails: movieDetails)
        }
    }
    
    func getMovieDetailsFailure(error: Error) {
        print(error)
    }
    
    func getCastsSuccess(castsData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.castCollectionView.configCellDetails(cellData: castsData)
            self.castCollectionView.collectionView.reloadData()
        }
    }
    
    func getCastsFailure(error: Error) {
        print(error)
    }

}
