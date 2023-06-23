//
//  HeaderBannerView.swift
//  Pizza_mizza
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import UIKit

final class HeaderBannerView: UIView {
    
    lazy var collectionBanners: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collection.dataSource = self
        collection.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.id)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var bannersImagesNames = ["banner1", "banner2", "banner3", "banner4", "banner5", "banner6"]
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout(section: createCollectionView())
    }
    
    private func createCollectionView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        
        let rowHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let rowSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                             heightDimension: rowHeight)
        let row = NSCollectionLayoutGroup.horizontal(layoutSize: rowSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: row)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDataSource
extension HeaderBannerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannersImagesNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionBanners.dequeueReusableCell(withReuseIdentifier: HeaderCell.id, for: indexPath) as? HeaderCell else { return UICollectionViewCell()}
        let banners = bannersImagesNames[indexPath.row]
        cell.configure(banner: banners)
        
        return cell
    }
    
    
}
// MARK: - setup UI
extension HeaderBannerView {
    
    func setupUI() {
        addSubview(collectionBanners)

        NSLayoutConstraint.activate([
            collectionBanners.topAnchor.constraint(equalTo: topAnchor),
            collectionBanners.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionBanners.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionBanners.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
