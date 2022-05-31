//
//  Environments.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation


enum BaseURL: String {
    case LOCAL = "https://local.com"
    case QA = "https://qa.com" //In Use
    case DEV = "https://api.themoviedb.org/3/movie/upcoming"
    case PROD = "https://prod.com"
}

class Environments {
    
    static let shared: Environments = Environments()

    var baseURL: String?
    
    func setUpEnvironments(){
        #if LOCAL
        PersistentData.shared.baseURL.value = BaseURL.LOCAL.rawValue
        #elseif QA
        PersistentData.shared.baseURL.value = BaseURL.QA.rawValue
        #elseif DEV
        PersistentData.shared.baseURL.value = BaseURL.DEV.rawValue
        #elseif PROD
        PersistentData.shared.baseURL.value = BaseURL.PROD.rawValue
        #endif
    }
    
}
