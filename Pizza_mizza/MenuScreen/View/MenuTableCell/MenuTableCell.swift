//
//  MenuTableCell.swift
//  Pizza_mizza
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import UIKit.UITableViewCell
import Kingfisher

class MenuTableCell: UITableViewCell {
    
    static var id = "MenuTableCell"
    
// MARK: - private properties
    
    private lazy var itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var buyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderColor = UIColor.systemPink.cgColor
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemPink
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionItemView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Methods
    
    func configure(newtorkModel: ItemModel) {
        itemImage.kf.setImage(with: URL(string: newtorkModel.image_url ?? ""))
        itemNameLabel.text = newtorkModel.name ?? ""
        itemDescriptionLabel.text = newtorkModel.description ?? ""
        buyLabel.text = "abv : " + String(newtorkModel.abv ?? 0.0)
    }
    
    private func setupUI() {
        contentView.addSubview(itemImage)
        contentView.addSubview(descriptionItemView)
        
        descriptionItemView.addSubview(itemNameLabel)
        descriptionItemView.addSubview(itemDescriptionLabel)
        descriptionItemView.addSubview(buyLabel)
       
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Constraints.MainCell.top),
            itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Constraints.MainCell.leading),
            itemImage.heightAnchor.constraint(equalToConstant: Constants.Constraints.MainCell.imageHeight),
            itemImage.widthAnchor.constraint(equalToConstant: Constants.Constraints.MainCell.imageWidth),
            
            itemImage.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Constraints.MainCell.bot),
            
            descriptionItemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Constraints.MainCell.top),
            descriptionItemView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor , constant: Constants.Constraints.MainCell.trailing),
            descriptionItemView.bottomAnchor.constraint(equalTo: itemImage.bottomAnchor),
            descriptionItemView.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: Constants.Constraints.MainCell.betweenelements),
            
            itemNameLabel.topAnchor.constraint(equalTo: descriptionItemView.topAnchor),
            itemNameLabel.trailingAnchor.constraint(equalTo: descriptionItemView.trailingAnchor),
            itemNameLabel.leadingAnchor.constraint(equalTo: descriptionItemView.leadingAnchor),
            
            buyLabel.bottomAnchor.constraint(equalTo: descriptionItemView.bottomAnchor),
            buyLabel.trailingAnchor.constraint(equalTo: descriptionItemView.trailingAnchor),
            buyLabel.heightAnchor.constraint(equalToConstant: 32),
            buyLabel.widthAnchor.constraint(equalToConstant: 87),
            
            itemDescriptionLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10),
            itemDescriptionLabel.bottomAnchor.constraint(equalTo: buyLabel.topAnchor, constant: -10),
            itemDescriptionLabel.trailingAnchor.constraint(equalTo: descriptionItemView.trailingAnchor),
            itemDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionItemView.leadingAnchor),
        ])
    
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        contentView.layer.cornerRadius = 20
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
