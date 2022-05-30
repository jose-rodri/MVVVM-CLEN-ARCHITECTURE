//
//  HomeRouter.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import UIKit

class HomeRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
  private func  createViewController() -> UIViewController {
        
        let view = HomeViewController(nibName: "HomeViewController", bundle: Bundle.main)
        return view
    }
    
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else { fatalError("error desconocido")}
        self.sourceView = view
        
    }
}
