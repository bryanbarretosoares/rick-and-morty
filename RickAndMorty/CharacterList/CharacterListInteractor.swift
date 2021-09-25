//
//  CharacterListInteractor.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

protocol CharacterListInteracting {
    func fetchCharacter()
}

class CharacterListInteractor {
    
    private let service: CharacterListServicing
    private let presenter: CharacterListPresenting
    
    init(service: CharacterListServicing, presenter: CharacterListPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

extension CharacterListInteractor: CharacterListInteracting {
    func fetchCharacter() {
        
    }
}
