//
//  ErrorResponse.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation

class ErrorResponse: Codable {
    
    var code: Int?
    var message: String?
    var messageDetail: String?

    init(code: Int, message: String, messageDetail: String) {
        self.code = code
        self.message = message
        self.messageDetail = messageDetail
    }
    
    
}
