//
//  CategoriesView.swift
//  Pizza_mizza
//
//  Created by Artem on 23.06.2023.
//

import Foundation
import UIKit

protocol CategoryDelegateProtocol: AnyObject {
    func scrollToSelectedCategory(type: String)
}

final class CategoriesView: UITableViewHeaderFooterView {
    
    weak var delegate: CategoryDelegateProtocol?
    
    var selectedCategory: String
    // MARK: - private properties
    
    var categories: [String]?
   
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.id)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    // MARK: - Private methods
    
    private func setupViews() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
               
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout(section: createButtonView())
    }
    
    private func createButtonView() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let rowHeight = NSCollectionLayoutDimension.fractionalHeight(1)
        let rowSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.26), heightDimension: rowHeight)
        
        let row = NSCollectionLayoutGroup.horizontal(layoutSize: rowSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: row)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    // MARK: - Init
    
    init(categories: [String]?, selectedCategory: String) {
        self.categories = categories
        self.selectedCategory = selectedCategory
        super.init(reuseIdentifier: CategoriesCell.id)
        self.setupViews()
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource
extension CategoriesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.id, for: indexPath) as! CategoriesCell
        cell.configure(string: categories?[indexPath.row] ?? "")
//        collectionView.selectItem(at: IndexPath.init(row: 0, section: 0), animated: false, scrollPosition: .left)
        if categories?[indexPath.row] == selectedCategory {
            cell.isSelectedCell = true
        } else {
            cell.isSelectedCell = false
        }
        return cell
    }
}


extension CategoriesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        delegate?.scrollToSelectedCategory(type: categories?[indexPath.row] ?? "")
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoriesCell else { return }
        if categories?[indexPath.row] == selectedCategory {
            cell.isSelected = true
            
        } else {
            cell.isSelectedCell = false
        }
    }
}
