//
//  ManagerConnections.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation
import RxSwift

class ManagerConnections {
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    

    func fetchAssignedInfoReportsList(success: @escaping  (Movie) -> Void, failure: @escaping  (String) -> Void) {
        webService.load(modelType: Movie.self, from: .listMovie(serviceType: .MovieList ))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] results in
            success(results)
            }, onError: { [weak self] error in
                failure("Service error")
            }).disposed(by: disposeBag)
        
    }
    
    
}
