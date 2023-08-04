//
//  HeaderCell.swift
//  Pizza_mizza
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import UIKit.UICollectionViewCell

final class HeaderCell: UICollectionViewCell {
    
    static let id = "HeaderCell"
    
    private let bannerImageView: UIImageView = {
        let banner = UIImageView()
        banner.contentMode = .scaleAspectFill
        banner.clipsToBounds = true
        banner.layer.cornerRadius = 10
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }()
    
    func configure(banner: String) {
        bannerImageView.image = UIImage(named: banner)
    }
    
    private func setupView() {
        addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
