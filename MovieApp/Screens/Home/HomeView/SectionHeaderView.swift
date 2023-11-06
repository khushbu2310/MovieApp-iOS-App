//
//  SectionHeaderView.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol SectionHeaderToView: AnyObject {
    func showAllBtnTapped(index: Int)
}

class SectionHeaderView: UIView {
    weak var delegate: SectionHeaderToView?
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .interMedium(size: 20)
        return label
    }()
    
    let showAllBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show all", for: .normal)
        button.titleLabel?.font = .interLight(size: 15)
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(showAllBtn)
        showAllBtn.addTarget(self, action: #selector(SectionHeaderView.showAllBtnTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            showAllBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    @objc private func showAllBtnTapped() {
        delegate?.showAllBtnTapped(index: showAllBtn.tag)
    }
    
}
