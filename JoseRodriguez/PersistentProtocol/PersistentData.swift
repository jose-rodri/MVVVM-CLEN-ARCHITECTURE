//
//  PersistentData.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation


enum Keys: String {
    case baseURL
}

final class PersistentData {
    static let shared = PersistentData()
    
    var baseURL = Persistent<String>(Keys.baseURL.rawValue)
    
    init() {
        self.baseURL.value = ""
    }
}
