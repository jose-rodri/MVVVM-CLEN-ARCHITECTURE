//
//  Endpoint.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 31/05/22.
//

import Foundation

internal enum Endpoint {
    case listMovie(serviceType: MovieService)
 
}


internal extension Endpoint {
    func request(with baseURL: URL) -> URLRequest {
        print("\n")
        print("baseURL: \(baseURL)")
        print("endpoint: \(properties.path)")
        print("\n")
        let baseURLWithPath = baseURL.appendingPathComponent(properties.path).absoluteString.removingPercentEncoding

       
        var newParameters = properties.parameters
        properties.parameters.forEach { newParameters.updateValue($1, forKey: $0) }
     
        
        let components = URLComponents(url: URL(string: baseURLWithPath!)! , resolvingAgainstBaseURL: false)!

        var request = URLRequest(url: components.url!)
        request.httpMethod = properties.method.rawValue

        if properties.method == .post {
            var headers = request.allHTTPHeaderFields ?? [:]
            headers["Content-Type"] = "application/json"
            request.allHTTPHeaderFields = headers
            let jsonString = properties.jsonString
            request.httpBody = jsonString.data(using: String.Encoding.utf8)
        }

        return request
    }
    
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var jsonString: String { get }
}

extension Requestable {
    var jsonString: String {
        guard let json = json(from: parameters) else { return "" }
        return json
    }
}


func json(from object: Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: data, encoding: String.Encoding.utf8)
}

private extension Endpoint {
    var properties: Requestable {
        switch self {
        case .listMovie(let serviceType):
            return MovieNetworkFactory.getService(from: serviceType)
        }
    }
}

