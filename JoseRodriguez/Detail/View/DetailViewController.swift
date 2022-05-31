//
//  DetailViewController.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {

    
    private var router = DetailRouter()
    private var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        
    }


}
