//
//  TVShowDetailsViewController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation
import UIKit

protocol TVShowDetailsViewInterface {
    var presenter: TVShowDetailsViewToPresenterInterface? { get set }
    func getTVShowDetailsSuccess(tvShowDetails: MovieTVDetailsModel)
    func getCastsSuccess(castsData: [CellDataObject])
    func getVideosSuccess(castData: [String])
    func getTVShowDataFailure(error: Error)
}

class TVShowDetailsViewController: UIViewController, TVShowDetailsViewInterface {
    var presenter: TVShowDetailsViewToPresenterInterface?
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
        let videos = MovieAppCollectionView(scrollDirection: .horizontal, itemSize: CGSize(width: 150, height: 100), cell: YoutubeCollectionViewCell.self, identifier: YoutubeCollectionViewCell.identifier)
        videos.translatesAutoresizingMaskIntoConstraints = false
        videos.collectionView.showsHorizontalScrollIndicator = false
        return videos
    }()
    
    private var castCollectionView: MovieAppCollectionView = {
        let casts = MovieAppCollectionView(scrollDirection: .horizontal, itemSize: CGSize(width: 120, height: 200), cell: MovieAppCollectionViewCell.self, identifier: MovieAppCollectionViewCell.identifier)
        casts.translatesAutoresizingMaskIntoConstraints = false
        casts.collectionView.showsHorizontalScrollIndicator = false
        return casts
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getTVShowDetails()
        delegate = headerDetails as? MovieDetailsToViewInterface
        castCollectionView.delegate = self
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
            videoLabel.topAnchor.constraint(equalTo: headerDetails.bottomAnchor, constant: 15),
            videoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoCollectionView.topAnchor.constraint(equalTo: videoLabel.bottomAnchor, constant: 15),
            videoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupCastConstraints() {
        NSLayoutConstraint.activate([
            castLabel.topAnchor.constraint(equalTo: videoCollectionView.bottomAnchor, constant: 15),
            castLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            castLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            castCollectionView.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 15),
            castCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            castCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 200),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: castCollectionView.bottomAnchor, constant: 110)
        ])
    }
    
    func getTVShowDetailsSuccess(tvShowDetails: MovieTVDetailsModel) {
        DispatchQueue.main.async {
            self.title = tvShowDetails.title
            self.delegate?.configureDetails(details: tvShowDetails)
        }
    }
        
    func getCastsSuccess(castsData: [CellDataObject]) {
        DispatchQueue.main.async {
            self.castCollectionView.configContent(dataList: castsData)
            self.castCollectionView.collectionView.reloadData()
        }
    }
        
    func getVideosSuccess(castData: [String]) {
        DispatchQueue.main.async {
            self.videoCollectionView.configContent(dataList: castData)
            self.videoCollectionView.collectionView.reloadData()
        }
    }

    func getTVShowDataFailure(error: Error) {
        print(error)
    }
}

extension TVShowDetailsViewController: CellActionDelegate {
    func cellClicked(indexPath: IndexPath) {
        presenter?.navigateToCastDetails(indexPath: indexPath)
    }
}
