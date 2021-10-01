//
//  CharacterEndpoint.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import Foundation

enum CharacterEndpoint {
    case getAllCharacters(page: Int)
    case getDetails(id: Int)
}

extension CharacterEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getAllCharacters:
            return "/api/character"
        case .getDetails(let id):
            return "/api/character/\(id)"
        }
    }
    
    var params: [String : String] {
        switch self {
        case .getAllCharacters(page: let page):
            return ["page":"\(page)"]
            
        default:
            return [:]
        }
    }
}
