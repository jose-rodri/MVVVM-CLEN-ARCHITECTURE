//
//  LoginRouter.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import UIKit

class LoginRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController {
        let view = LoginViewController(nibName: "LoginViewController", bundle: Bundle.main)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController? ) {
        guard let view = sourceView else { fatalError("error") }
        self.sourceView = view
    }
    
    
}
