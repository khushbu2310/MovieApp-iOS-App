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
        title.font = .interMedium(size: 40)
        title.numberOfLines = 0
        return title
    }()
    
    private let movieGenre: UILabel = {
        let genre = UILabel()
        genre.translatesAutoresizingMaskIntoConstraints = false
        genre.font = .interMedium(size: 15)
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
//        stack.distribution = .equalSpacing
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private let voteLabel: UILabel = {
        let vote = UILabel()
        vote.font = .interMedium(size: 15)
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
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .interMedium(size: 15)
        return date
    }()
    
    private let runTimeLabel: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = .interMedium(size: 15)
        return time
    }()
    
    private let languageLabel: UILabel = {
        let lan = UILabel()
        lan.translatesAutoresizingMaskIntoConstraints = false
        lan.font = .interMedium(size: 15)
        return lan
    }()
        
    private lazy var movieDateTimeLanStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dateLabel, runTimeLabel, languageLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 3
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
            movieDateTimeLanStack.widthAnchor.constraint(equalToConstant: 130),
            subStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: movieTitleGenreStarStack.bottomAnchor, constant: 10)
        ])
    }
}

extension MovieAppDetailsView: MovieDetailsToViewInterface {
    func configureDetails(details: MovieTVDetailsModel) {
        movieImage.setImage(with: details.image)
        movieTitle.text = details.title
        movieGenre.text = details.genre
        voteLabel.text = details.voteCount
        dateLabel.text = details.date
        runTimeLabel.text = details.runtime
        languageLabel.text = details.language
        
        dateLabel.attachIconToLabel(image: UIImage(named: "calender")!, text: details.date)
        if details.runtime != nil {
            runTimeLabel.attachIconToLabel(image: UIImage(named: "clock")!, text: details.runtime ?? "No time")
            languageLabel.attachIconToLabel(image: UIImage(named: "earth")!, text: details.language ?? "english")
        } else {
            runTimeLabel.attachIconToLabel(image: UIImage(named: "tv")!, text: details.episodes ?? "0")
            languageLabel.attachIconToLabel(image: UIImage(named: "ytIcon")!, text: details.seasons ?? "0")
        }
        descriptionLabel.text = details.description
    }
}
