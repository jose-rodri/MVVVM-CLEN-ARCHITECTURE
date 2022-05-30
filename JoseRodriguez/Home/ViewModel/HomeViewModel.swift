//
//  HomeViewModel.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation

class HomeViewModel {
    
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    
    
    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    
    
}
