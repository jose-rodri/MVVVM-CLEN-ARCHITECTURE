//
//  DetailRouter.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import UIKit

class DetailRouter {
    
    var viewController: UIViewController {
         return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    var movieData: MovieData?
    
    init(data: MovieData? = nil) {
        self.movieData = data
    }
    
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else { fatalError("Error desconocido")}
        self.sourceView = view
    }
    
    
    
    private func  createViewController() -> UIViewController {
          let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        //data pass
          return view
      }
    
    
    
    func navigateDetailView(data: MovieData) {
        let detailView = DetailRouter(data: data).viewController
        sourceView?.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
}
