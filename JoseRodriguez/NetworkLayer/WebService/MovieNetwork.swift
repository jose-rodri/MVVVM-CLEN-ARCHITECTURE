//
//  MovieNetwork.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 30/05/22.
//



import Foundation

enum MovieService: ServiceEnum {
    case MovieList
}

struct MovieNetworkFactory: Networking {

    typealias EnumType = MovieService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
     
        case .MovieList:
            return MovieNetwork()
       
        }
    }
}

extension MovieNetworkFactory {
    
    private struct MovieNetwork: Requestable {
        var method: HTTPMethod = .get
        var path: String = "?page=1&api_key=f46b58478f489737ad5a4651a4b25079"
        var parameters: [String: Any] = [:]

    }

}
