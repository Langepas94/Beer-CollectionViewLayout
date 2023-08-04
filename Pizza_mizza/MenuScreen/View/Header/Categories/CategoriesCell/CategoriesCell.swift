//
//  CategoriesCell.swift
//  Pizza_mizza
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import UIKit

final class CategoriesCell: UICollectionViewCell {
    
    static let id = "CategoriesCell"
    
    // MARK: Properties
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.2).cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    var isSelectedCell: Bool = false {
        didSet {
            if isSelectedCell {
                labelView.backgroundColor = .systemPink.withAlphaComponent(0.2)
            } else {
                labelView.backgroundColor = .white
            }
        }
    }
  
    // MARK: Methods
    
    func configure(string: String) {
        labelView.text = string
    }
    
    private func setupView() {
        
        backgroundColor = .systemBackground
        labelView.clipsToBounds = true
        labelView.layer.cornerRadius = 10
        
        contentView.addSubview(labelView)
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("didnt found storyboard here")
    }
}
