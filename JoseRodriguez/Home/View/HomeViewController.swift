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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.bind(view: self, router: router)

        // Do any additional setup after loading the view.
    }


}
