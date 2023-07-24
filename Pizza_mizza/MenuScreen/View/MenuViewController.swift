//
//  ViewController.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    var presenter: MenuPresenterProtocol?
    
    // MARK: - private properties
    
    private lazy var menuTableView: UITableView = {
        let table = UITableView()
        table.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.id)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .singleLine
        table.separatorInset = .zero
        table.tableHeaderView = headerBanners
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
    }
}

// MARK: - Setup Table Delegate/Datasource
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter?.mainData?.tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuTableCell.id, for: indexPath) as? MenuTableCell else { return UITableViewCell()}
        guard let model = presenter?.mainData?.tableData?[indexPath.row] else {
            return UITableViewCell() }
        cell.selectionStyle = .none
//        cell.configure(newtorkModel: model)
        cell.configureFromBeerObject(beerObject: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let categories = ["1", "2", "3", "4", "5", "6"]
        let categories = presenter?.mainData?.categories  ?? ["empty"]
        let view = CategoriesView(categories: categories)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    
}
