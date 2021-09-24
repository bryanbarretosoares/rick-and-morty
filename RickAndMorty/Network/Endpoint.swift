//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

protocol Endpoint {
    var body: Data? { get set }
    var headers: [String: String]  { get set }
    var scheme: String { get set }
    var host: String { get set }
    var method: HTTPMethod  { get set }
    var path: String  { get set }
    var params: [String: String] { get set }
}

extension Endpoint {
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "rickandmortyapi.com"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: [String:String] {
        return [:]
    }
}
