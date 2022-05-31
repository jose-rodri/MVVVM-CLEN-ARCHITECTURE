//
//  HomeViewModel.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    private var localConnnections = LocalManagerConnections()
    private var managerConnnections = ManagerConnections()
    
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    var estado: String?
    var data = [Result]()
    

    
    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func callList() {
        managerConnnections.getListService { (data) in
        self.data = data.results
        } failure: { (_) in
            
        }
    
    }
  
    
    
    func localData(){
        localConnnections.getListService { (data) in
            //get data
        } failure: { (_) in
            
        }
    }
    
}

