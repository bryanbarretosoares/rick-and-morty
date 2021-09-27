//
//  CharacterListPresenter.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

protocol CharacterListPresenting {
    
    var viewController: CharacterListDisplaying? { get set }
    
    func didFetch(_ characters: [Character])
    func didFetch(_ error: APIError)
}

class CharacterListPresenter {
    
    weak var viewController: CharacterListDisplaying?
    private let coordinator: CharacterListCoordinating
    
    init(coordinator: CharacterListCoordinating) {
        self.coordinator = coordinator
    }
}

extension CharacterListPresenter: CharacterListPresenting {
    func didFetch(_ characters: [Character]) {
        let viewModels = characters.map {
            return CharacterViewModel(model: $0)
        }
        viewController?.display(characters: viewModels)
    }
    
    func didFetch(_ error: APIError) {
        viewController?.display(message: error.localizedDescription)
    }
}
