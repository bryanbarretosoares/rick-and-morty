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
    
    let service: CharacterListServicing
    
    init(service: CharacterListServicing) {
        self.service = service
    }
}

extension CharacterListInteractor: CharacterListInteracting {
    func fetchCharacter() {
        
    }
}
