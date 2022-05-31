//
//  DetailViewModel.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import UIKit

class DetailViewModel {
    
 
    private var managerConnnections = ManagerConnections()
    private weak var view: DetailViewController?
    private var router: DetailRouter?
    
    func bind(view: DetailViewController, router: DetailRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
        
    }
    

}
