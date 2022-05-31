//
//  ServiceProtocols.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 31/05/22.
//

import Foundation

protocol ServiceEnum {}

protocol Networking {
    associatedtype EnumType: ServiceEnum
    static func getService(from type: EnumType) -> Requestable
}
