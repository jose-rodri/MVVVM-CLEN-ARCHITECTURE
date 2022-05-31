//
//  HomeViewModel.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private var managerConnnections = ManagerConnections()
    
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    var estado: String?
    var data = [Result]()
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    

    
    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getList(){
        managerConnnections.fetchAssignedInfoReportsList { (data) in
        self.data = data.results
        } failure: { (_) in
            
        }
    
    }
    
    func lista(){
        webService.load(modelType: Movie.self, from: .listMovie(serviceType: .MovieList ))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] results in
               // results.validate {
                self?.data =  results.results
                //}
            }, onError: { [weak self] error in
               // failure("Service Error")
            }).disposed(by: disposeBag)
    }
    
    
}

