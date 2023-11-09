//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol HomeViewInterface {
    var presenter: HomeViewToPresenterInterface? { get set }
    func getMovieDataSuccess()
    func getMovieDataFailure(error: Error)
    func reloadTableView()
    func setupHeaderData(lable: String, voteCount: String, image: String, voteAvg: Double)
}

class HomeViewController: UIViewController, HomeViewInterface {
    var presenter: HomeViewToPresenterInterface?
    
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
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .interMedium(size: 30)
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
        voteLabel.font = .interLight(size: 15)
        return voteLabel
    }()
    
    let genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 25)
        layout.minimumLineSpacing = 20
        let genreCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        genreCollection.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        genreCollection.translatesAutoresizingMaskIntoConstraints = false
        genreCollection.showsHorizontalScrollIndicator = false
        return genreCollection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getMoviesData()
        setupTitle()
        setupUI()
        setupConstraints()
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
    }
    
    func setupUI() {
        view.addSubview(mainView)
        mainView.addSubview(movieTableView)
    }
    
    func setupConstraints() {
        setupMainViewConstraints()
        setupTableViewConstraints()
    }
            
    func setupMainViewConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: mainView.topAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
        setupTableViewHeader()
    }
    
    func setupTableViewHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: mainView.frame.size.width, height: 300))
        header.addSubview(headerImage)
        header.addSubview(headerLabel)
        header.addSubview(starStackView)
        header.addSubview(voteCountLabel)
        header.addSubview(genreCollectionView)
        movieTableView.tableHeaderView = header
        movieTableView.delegate = self
        movieTableView.dataSource = self

        NSLayoutConstraint.activate([
            headerImage.heightAnchor.constraint(equalToConstant: 250),
            headerImage.topAnchor.constraint(equalTo: header.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: -40),
            headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            starStackView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 10),
            starStackView.heightAnchor.constraint(equalToConstant: 15),
            starStackView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            
            voteCountLabel.centerYAnchor.constraint(equalTo: starStackView.centerYAnchor),
            voteCountLabel.leadingAnchor.constraint(equalTo: starStackView.trailingAnchor, constant: 10),
                
            genreCollectionView.heightAnchor.constraint(equalToConstant: 30),
            genreCollectionView.topAnchor.constraint(equalTo: voteCountLabel.bottomAnchor, constant: 5),
            genreCollectionView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            genreCollectionView.trailingAnchor.constraint(equalTo: header.trailingAnchor)
        ])
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self

    }
        
    func setupStars(voteAvg: Double) {
        var index = Int((voteAvg/2.0).rounded())
        setStarIndex(start: 0, end: index, img: "starFilled")
        let remainingStars = 5 - index
        if remainingStars > 0 {
            setStarIndex(start: index, end: 5, img: "starEmpty")
        }
    }
    
    func setStarIndex(start: Int, end: Int, img: String) {
        for _ in start..<end {
            let imageView = UIImageView()
            imageView.image = UIImage(named: img)!
            starStackView.addArrangedSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 15)
            ])
        }
    }
    
    func setupHeaderData(lable: String, voteCount: String, image: String, voteAvg: Double) {
        DispatchQueue.main.async {
            self.headerLabel.text = lable
            self.voteCountLabel.text = voteCount
            self.headerImage.setImage(with: image)
            self.setupStars(voteAvg: voteAvg)
        }
    }
    
    func getMovieDataSuccess() {
        reloadTableView()
    }
    
    func getMovieDataFailure(error: Error) {
        print(error)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.movieCollectionView.collectionView.tag = indexPath.section
        let collectionViewData: [CellDataObject] = presenter?.configMovieDetails(index: indexPath.section) ?? []
        cell?.movieCollectionView.configContent(dataList: collectionViewData)
        cell?.movieCollectionView.collectionView.reloadData()
        return cell ?? UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        headerView.delegate = self
        headerView.titleLabel.text = presenter?.configHeaderTitle(index: section)
        headerView.showAllBtn.tag = section
        return headerView
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.genreTypeList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell
        cell?.genreDelegate = self
        cell?.genreButton.tag = indexPath.row
        cell?.configGenreType(data: presenter?.genreTypeList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewController: SectionHeaderToView {
    func showAllBtnTapped(index: Int) {
        presenter?.showAllBtnTapped(index: index)
    }
}

extension HomeViewController: GenreCollectionInterface {
    func didTapGenreBtn(_ index: Int) {
        presenter?.didTapGenreBtn(index)
    }
}
