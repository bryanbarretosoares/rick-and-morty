//
//  CharacterDetailService.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import Foundation

protocol CharacterDetailServicing {
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<CharacterDetailModel, APIError>) -> Void)
}

class CharacterDetailService {
    
}

extension CharacterDetailService: CharacterDetailServicing {
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<CharacterDetailModel, APIError>) -> Void) {
        let endpoint = CharacterEndpoint.getDetails(id: id)
        Network.shared.fetch(endpoint: endpoint, completion: completion)
    }
}
