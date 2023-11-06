//
//  YoutubeCollectionViewCell.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 05/11/23.
//

import Foundation
import WebKit

class YoutubeCollectionViewCell: UICollectionViewCell {
    static let identifier = YoutubeCollectionViewCell.description()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(webView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: contentView.topAnchor),
            webView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configureCellDetails(_ data: Codable) {
        guard let data = data as? String else { return }
        guard let url = URL(string: "\(Constants.ytBaseURL)\(data)") else { return }
        webView.load(URLRequest(url: url))
    }
}
