//
//  CharacterDetailInteractor.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import Foundation

protocol CharacterDetailInteracting {
    func fetchCharacterDetail()
}

class CharacterDetailInteractor {
    
    private let service: CharacterDetailServicing
    private let presenter: CharacterDetailPresenting
    let id: Int
    
    init(id: Int, presenter: CharacterDetailPresenting, service: CharacterDetailServicing) {
        self.presenter = presenter
        self.service = service
        self.id = id
    }
}

extension CharacterDetailInteractor: CharacterDetailInteracting {
    func fetchCharacterDetail() {
        service.fetchCharacterDetail(id: id) { [weak self] result in
            switch result {
            case .success(let character):
                self?.presenter.didFetch(character)
            case .failure(let error):
                self?.presenter.didFetch(error)
            }
        }
    }
}
