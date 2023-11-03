//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol HomeViewInterface {
    var presenter: HomePresenterInterface? { get set }

    func reloadTableView()
    
    func popularMovieFailure(error: Error)
    func topRatedMovieFailure(error: Error)
    func upComingMovieFailure(error: Error)
    func nowPlayingMovieFailure(error: Error)

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

}

class HomeViewController: UIViewController, HomeViewInterface {
    var presenter: HomePresenterInterface?
    
    private let mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private let movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.setImage(with: Constants.defaultImgUrl)
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Expendables"
        label.font = .interMedium(size: 40)
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private let voteCountLabel: UILabel = {
        let voteLabel = UILabel()
        voteLabel.translatesAutoresizingMaskIntoConstraints = false
        voteLabel.text = "469 Votes"
        voteLabel.font = .interLight(size: 15)
        return voteLabel
    }()
    
    let genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 30)
        layout.minimumLineSpacing = 20
        let genreCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        genreCollection.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        genreCollection.translatesAutoresizingMaskIntoConstraints = false
        genreCollection.showsHorizontalScrollIndicator = false
        return genreCollection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        setupConstraints()
        setupStarStack(fullStar: 3, halfStar: 2)
        presenter?.getMovieList()
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
    }
    
    func setupUI() {
        view.addSubview(mainView)
        mainView.addSubview(movieTableView)
        setupDelegates()
    }
    
    func setupDelegates() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
    }
    
    func setupConstraints() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: mainView.frame.size.width, height: 350))
        header.addSubview(headerImage)
        header.addSubview(headerLabel)
        header.addSubview(starStackView)
        header.addSubview(voteCountLabel)
        header.addSubview(genreCollectionView)
        movieTableView.tableHeaderView = header

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            movieTableView.topAnchor.constraint(equalTo: mainView.topAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            headerImage.heightAnchor.constraint(equalToConstant: 250),
            headerImage.topAnchor.constraint(equalTo: header.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: headerImage.bottomAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            starStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5),
            starStackView.heightAnchor.constraint(equalToConstant: 15),
            starStackView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            
            voteCountLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            voteCountLabel.heightAnchor.constraint(equalToConstant: 15),
            voteCountLabel.leadingAnchor.constraint(equalTo: starStackView.trailingAnchor, constant: 10),
                
            genreCollectionView.heightAnchor.constraint(equalToConstant: 30),
            genreCollectionView.topAnchor.constraint(equalTo: voteCountLabel.bottomAnchor, constant: 15),
            genreCollectionView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            genreCollectionView.trailingAnchor.constraint(equalTo: header.trailingAnchor)
        ])
    }
    
    func setupStarStack(fullStar: Int, halfStar: Int) {
        DispatchQueue.main.async {
            if (fullStar + halfStar) == 0 {
                for _ in 1...5 {
                    let emptyStarView = self.setupStarImage(imgName: "starEmpty")
                    self.starStackView.addArrangedSubview(emptyStarView)
                }
            } else {
                for _ in 1...fullStar {
                    let filledStarView = self.setupStarImage(imgName: "starFilled")
                    self.starStackView.addArrangedSubview(filledStarView)
                }
                
                if halfStar != 0 {
                    let halfStarView = self.setupStarImage(imgName: "starHalf")
                    self.starStackView.addArrangedSubview(halfStarView)
                }
                var emptyStars: Int = 5 - (fullStar + halfStar)
                if halfStar>1 {
                    emptyStars = emptyStars + halfStar - 1
                }
                if emptyStars > 0 {
                    for _ in 1...emptyStars {
                        let emptyStarView = self.setupStarImage(imgName: "starEmpty")
                        self.starStackView.addArrangedSubview(emptyStarView)
                    }
                }
            }
            
        }

    }
    
    func setupStarImage(imgName: String) -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: imgName))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        imgView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        return imgView
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
            
    func popularMovieFailure(error: Error) {
        print("Error in fetching popular movies \(error)")
    }
    
    func topRatedMovieFailure(error: Error) {
        print("Error in fetching top rated movies \(error)")
    }

    func upComingMovieFailure(error: Error) {
        print("Error in fetching upcoming movies \(error)")
    }
    
    func nowPlayingMovieFailure(error: Error) {
        print("Error in fetching movies in theaters \(error)")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        presenter?.heightForSectionAt(tableView: tableView, section: section) ?? 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        presenter?.heightForRowAt(tableView: tableView, indexPath: indexPath) ?? 0.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.cellForRowAt(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return presenter?.setupHeaderView(section: section)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.genreTypeList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter?.genreCollectionCellForItemAt(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
}
