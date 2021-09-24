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
    var baseURL: String  { get set }
    var method: HTTPMethod  { get set }
    var endpoint: String  { get set }
    var params: [String: String] { get set }
}

extension Endpoint {
    var baseURL: String {
        return "https://rickandmortyapi.com/api/"
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
    
    var params: [String: String] {
        return [:]
    }
}
