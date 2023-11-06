//
//  CastDetailsViewController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation
import UIKit

protocol CastDetailsViewInterface {
    var presenter: CastDetailsPresenterInterface? { get set }
    func getPersonDetailsSuccess(castDetails: PersonDetailsByIdEntity)
    func getPersonDetailsFailure(error: Error)
    
    func getCastImagesSuccess(castDetails: [CellDataObject])
    func getCastImagesFailure(error: Error)
    
    func getCastCombineSuccess(castDetails: [CellDataObject])
    func getCastCombineFailure(error: Error)
}

class CastDetailsViewController: UIViewController, CastDetailsViewInterface {
    
    var presenter: CastDetailsPresenterInterface?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let headerImage: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = img.frame.width / 2
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.clipsToBounds = true
        return img
    }()
    
    let headerTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .interMedium(size: 30)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    let headerGenre: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .interMedium(size: 15)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()

    let headerDescription: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .interLight(size: 15)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    let photosTitle: UILabel = {
        let title = UILabel()
        title.text = "PHOTOS"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .interMedium(size: 25)
        return title
    }()
    
    let photoCollection: MovieAppCollectionView = {
        let photos = MovieAppCollectionView(scrollDirection: .horizontal, itemSize: CGSize(width: 100, height: 150), cell: MovieAppCollectionViewCell.self, identifier: MovieAppCollectionViewCell.identifier)
        photos.translatesAutoresizingMaskIntoConstraints = false
        photos.collectionView.showsHorizontalScrollIndicator = false
        return photos
    }()

    let knownForTitle: UILabel = {
        let title = UILabel()
        title.text = "KNOWN FOR"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .interMedium(size: 25)
        return title
    }()
    
    let knownForCollection: MovieAppCollectionView = {
        let knownFor = MovieAppCollectionView(scrollDirection: .horizontal, itemSize: CGSize(width: 120, height: 200), cell: MovieAppCollectionViewCell.self, identifier: MovieAppCollectionViewCell.identifier)
        knownFor.translatesAutoresizingMaskIntoConstraints = false
        knownFor.collectionView.showsHorizontalScrollIndicator = false
        return knownFor
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetails()
        setupUI()
        setupConstraints()
    }
        
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerView)
        headerView.addSubview(headerImage)
        headerView.addSubview(headerTitle)
        headerView.addSubview(headerGenre)
        headerView.addSubview(headerDescription)
        headerView.addSubview(photosTitle)
        headerView.addSubview(photoCollection)
        headerView.addSubview(knownForTitle)
        headerView.addSubview(knownForCollection)
    }
    
    func setupConstraints() {
        setupScrollViewConstraints()
        setupHeaderViewConstraints()
        setupCastDetailsConstraints()
        setupPhotosConstraints()
        setupKnownForConstraints()
    }
    
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func setupCastDetailsConstraints() {
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: headerView.topAnchor),
//            headerImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: 150),
            headerImage.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.4),
//            headerImage.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),

            headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            headerTitle.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 20),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            headerGenre.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 10),
            headerGenre.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerGenre.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            headerDescription.topAnchor.constraint(equalTo: headerGenre.bottomAnchor, constant: 10),
            headerDescription.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerDescription.trailingAnchor.constraint(equalTo: headerView.trailingAnchor)
        ])
    }
    
    func setupPhotosConstraints() {
        NSLayoutConstraint.activate([
            photosTitle.topAnchor.constraint(equalTo: headerDescription.bottomAnchor, constant: 10),
            photosTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            photosTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            photoCollection.topAnchor.constraint(equalTo: photosTitle.bottomAnchor, constant: 10),
            photoCollection.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            photoCollection.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupKnownForConstraints() {
        NSLayoutConstraint.activate([
            knownForTitle.topAnchor.constraint(equalTo: photoCollection.bottomAnchor, constant: 10),
            knownForTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            knownForTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            knownForCollection.topAnchor.constraint(equalTo: knownForTitle.bottomAnchor, constant: 10),
            knownForCollection.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            knownForCollection.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            knownForCollection.heightAnchor.constraint(equalToConstant: 200),
            headerView.bottomAnchor.constraint(greaterThanOrEqualTo: knownForCollection.bottomAnchor, constant: 110)
        ])
    }
    
    func getPersonDetailsSuccess(castDetails: PersonDetailsByIdEntity) {
        DispatchQueue.main.async {
            self.title = castDetails.name
            self.headerImage.setImage(with: (Constants.imgBaseUrl + castDetails.profilePath))
            self.headerTitle.text = castDetails.name
            self.headerGenre.text = castDetails.knownForDepartment
            self.headerDescription.text = castDetails.biography
        }
    }
    
    func getPersonDetailsFailure(error: Error) {
        print(error)
    }
    
    func getCastImagesSuccess(castDetails: [CellDataObject]) {
        DispatchQueue.main.async {
            self.photoCollection.configContent(dataList: castDetails)
            self.photoCollection.collectionView.reloadData()
        }
    }
    
    func getCastImagesFailure(error: Error) {
        print(error)
    }
    
    func getCastCombineSuccess(castDetails: [CellDataObject]) {
        DispatchQueue.main.async {
            self.knownForCollection.configContent(dataList: castDetails)
            self.knownForCollection.collectionView.reloadData()
        }
    }
    
    func getCastCombineFailure(error: Error) {
        print(error)
    }
}
