//
//  HomeProtocols.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 31/05/22.
//

import Foundation

protocol listVideoUseCase {
    func getListService(success: @escaping  (Movie) -> Void, failure: @escaping  (String) -> Void)
}

protocol thirdPartyData {
    func getThirdPartyData(success: @escaping  (Movie) -> Void, failure: @escaping  (String) -> Void)
}
