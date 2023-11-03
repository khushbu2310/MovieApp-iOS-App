//
//  MovieAppDetailsView.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation
import UIKit

class MovieAppDetailsView: UIView {
    
    private let movieImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.setImage(with: Constants.defaultImgUrl)
        return img
    }()
    
    private let movieTitle: UILabel = {
        let title = UILabel()
        title.text = "Movie Name"
        title.font = .interMedium(size: 40)
        title.numberOfLines = 0
        return title
    }()
    
    private let movieGenre: UILabel = {
        let genre = UILabel()
        genre.text = "Action/Crime/Science Fiction"
        genre.translatesAutoresizingMaskIntoConstraints = false
        genre.font = .interLight(size: 15)
        genre.numberOfLines = 0
        return genre
    }()
    
    private lazy var starStackView: UIStackView = {
        let stack = UIStackView()
        for _ in 1...5 {
            let star = UIImageView(image: UIImage(named: "starFilled"))
            stack.addArrangedSubview(star)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let voteLabel: UILabel = {
        let vote = UILabel()
        vote.text = "1301 votes"
        vote.font = .interLight(size: 15)
        vote.translatesAutoresizingMaskIntoConstraints = false
        return vote
    }()
    
    private lazy var starVoteStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starStackView, voteLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var movieTitleGenreStarStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [movieTitle, movieGenre, starVoteStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    private let dateLabel: UILabel = {
        let date = UILabel()
        date.text = "8/14/20"
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .interLight(size: 15)
        return date
    }()
    
    private let runTimeLabel: UILabel = {
        let time = UILabel()
        time.text = "01:53/113 min"
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = .interLight(size: 15)
        return time
    }()
    
    private let languageLabel: UILabel = {
        let lan = UILabel()
        lan.text = "English"
        lan.translatesAutoresizingMaskIntoConstraints = false
        lan.font = .interLight(size: 15)
        return lan
    }()
    
    private lazy var movieDateTimeLanStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dateLabel, runTimeLabel, languageLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var subStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [movieTitleGenreStarStack, movieDateTimeLanStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .top
        return stack
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is movie details description"
        label.font = .interLight(size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [movieImage, subStack, descriptionLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 250),
            movieDateTimeLanStack.widthAnchor.constraint(equalToConstant: 100),
            subStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: movieTitleGenreStarStack.bottomAnchor, constant: 10)
        ])
    }
}

extension MovieAppDetailsView: MovieDetailsToViewInterface {
    func configureMovieDetails(movieDetails: MovieTVDetailsModel) {
        movieImage.setImage(with: movieDetails.image)
        movieTitle.text = movieDetails.title
        movieGenre.text = movieDetails.genre
        voteLabel.text = movieDetails.voteCount
        dateLabel.text = movieDetails.date
        runTimeLabel.text = movieDetails.runtime
        languageLabel.text = movieDetails.language
        descriptionLabel.text = movieDetails.description
    }
}
