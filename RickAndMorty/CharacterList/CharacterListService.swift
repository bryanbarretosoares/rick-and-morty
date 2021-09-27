//
//  CharacterListService.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

enum CharacterEndpoint {
    case getAllCharacters(page: Int)
}

extension CharacterEndpoint: Endpoint {
    var path: String {
        return "/api/character"
    }
    
    var params: [String : String] {
        switch self {
        case .getAllCharacters(page: let page):
            return ["page":"\(page)"]
        }
    }
}

protocol CharacterListServicing {
    func fetch(page: Int, completion: @escaping (Result<Response, APIError>) -> Void)
}

class CharacterListService {
    
}

extension CharacterListService: CharacterListServicing {
    func fetch(page: Int, completion: @escaping (Result<Response, APIError>) -> Void) {
        let endpoint: CharacterEndpoint = .getAllCharacters(page: page)
        Network.shared.fetch(endpoint: endpoint, completion: completion)
    }
}
