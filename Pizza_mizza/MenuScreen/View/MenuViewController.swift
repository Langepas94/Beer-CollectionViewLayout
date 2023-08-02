//
//  ViewController.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    var presenter: MenuPresenterProtocol?
    private var currentProductType: String?
    private var lastContentOffset: CGFloat = 0
    // MARK: - private properties
    
    private var menuTableView: UITableView = {
        let table = UITableView()
        table.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.id)
     
        table.separatorStyle = .singleLine
        table.separatorInset = .zero
        
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var headerBanners: HeaderBannerView = {
        let width = UIScreen.main.bounds.width
        let height = width * 0.3
        let banners = HeaderBannerView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: height)), bannersImagesNames: presenter?.mainData?.headerImageNames ?? [""])
        return banners
    }()
    
    var viewka: CategoriesView?
    var vv: String = ""
    var vvv: String? = ""
    
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        menuTableView.rowHeight = CGFloat(Constants.Constraints.rowOnTableHeight)
    }
}

// MARK: - view protocol implement

extension MenuViewController: MainViewProtocol {
    func tappedOnCategories() {
        //
    }
    
    func dataLoaded() {
        menuTableView.reloadData()
    }
    
    
}
// MARK: - Setup UI
extension MenuViewController {
    func setupUI() {
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.tableHeaderView = headerBanners
        
      
        let menuItem1 = UIAction(title: "Санкт-Петербург") { action in
            
        }

        let menuItem2 = UIAction(title: "Сургут") { action in
            
        }

        let menuItem3 = UIAction(title: "Волгоград") { action in
            
        }

        let cityChanger = UIBarButtonItem(title: "Москва", image: UIImage(systemName: "sun.fill"), primaryAction: nil, menu: UIMenu(title: "", options: .displayInline, children: [menuItem1, menuItem2, menuItem3]))
   
        cityChanger.tintColor = .black
        
        navigationItem.leftBarButtonItem = cityChanger
        
        view.addSubview(menuTableView)
        
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: view.topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        guard let categories = presenter?.setCategories() else { return }
        
        viewka = CategoriesView(categories: categories)
        viewka?.delegate = self
    }
}

// MARK: - Setup Table Delegate/Datasource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter?.mainData?.tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuTableCell.id, for: indexPath) as? MenuTableCell else { return UITableViewCell()}
        guard let model = presenter?.mainData?.tableData?[indexPath.row] else {
            return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureFromBeerObject(beerObject: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {


//        viewka?.collectionView.selectItem(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: .right)
        return viewka
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
// MARK: - CategoryDelegate
extension MenuViewController: CategoryDelegateProtocol {
    func scrollToSelectedCategory(type: String) {
        let products = presenter?.mainData?.tableData
        let index = products?.firstIndex(where: { $0.category == type })
        if let index = index {
            let indexPath = IndexPath(item: index, section: 0)
            
            menuTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
}

// MARK: - Table delegate

extension MenuViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let indexPath = menuTableView.indexPathsForVisibleRows?[1] {
            let productType = presenter?.mainData?.tableData?[indexPath.row].category
            if productType != currentProductType {
                currentProductType = productType

                guard let productType = productType else { return }

                let categories = presenter?.mainData?.categories  ?? ["empty"]
                guard let viewka = viewka else { return }
              
                viewka.categories = categories
                viewka.selectedCategory = productType
                
                let indexPaths = viewka.collectionView.indexPathsForVisibleItems
                
                if let lastIndexPath = indexPaths.last, scrollView.contentOffset.y > lastContentOffset{
                    viewka.collectionView.scrollToItem(at: lastIndexPath, at: .centeredHorizontally, animated: false)
                    
                    viewka.collectionView.reloadItems(at: indexPaths)
                } else if let firstIndexPath = indexPaths.first {
                    viewka.collectionView.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: false)
                    viewka.collectionView.reloadItems(at: indexPaths)
                }
                lastContentOffset = scrollView.contentOffset.y
            }
        }
    }
    
    
}
