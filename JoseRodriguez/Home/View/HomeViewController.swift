//
//  HomeViewController.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: HomeTableViewCell.cellType, bundle: nil) , forCellReuseIdentifier: HomeTableViewCell.cellType)
        }
    }
    
    private lazy var tableDelegate: HomeDelegate = {
        return HomeDelegate(actionDelegate: self)
    }()
    
    private var tableDataSource: HomeViewDataSource?
    
    
    
    var data = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        
        tableView.isHidden = true
        viewModel.callList()
        
        configTable()
        
        loadTable()
    }
    
    private func configTable() {
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        tableView.delegate = tableDelegate
        tableDataSource = HomeViewDataSource()
        tableView.dataSource = tableDataSource
    }
    
    
    func loadTable(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            self.data = viewModel.data
            if data.count > 0 {
                tableDataSource = HomeViewDataSource(data: data)
                self.tableView.dataSource = tableDataSource
                self.tableView.reloadData()
                tableView.isHidden = false
            } else {
                tableView.isHidden = true
            }
        }
    }
    
    
}


extension HomeViewController : HomeDelegateTableActionDelegate {
    func selected(index: Int) {
        print("SELECT: \(data[index]) \n ")
    }
}
