//
//  LoginViewModel.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation

class LoginViewModel {
    private weak var view: LoginViewController?
    private var router: LoginRouter?
    
    func bind(view: LoginViewController , router: LoginRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    
}
