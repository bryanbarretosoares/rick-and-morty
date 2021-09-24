//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

protocol Endpoint {
    var body: Data? { get }
    var headers: [String: String]  { get }
    var scheme: String { get }
    var host: String { get }
    var method: HTTPMethod  { get }
    var path: String  { get }
    var params: [String: String] { get }
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
    
    var params: [String: String] {
        return [:]
    }
}
