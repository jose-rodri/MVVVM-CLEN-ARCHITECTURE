//
//  Environments.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation


enum BaseURL: String {
    case LOCAL = "https://local.com"
    case QA = "https://api.themoviedb.org/3/movie/upcoming" //In Use
    case DEV = "https://dev.com"
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
