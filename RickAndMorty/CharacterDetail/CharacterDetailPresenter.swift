//
//  CharacterDetailPresenter.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import Foundation

protocol CharacterDetailPresenting {
    var viewController: CharacterDetailDisplaying? { get }
    
    func didFetch(_ character: CharacterDetailModel)
    func didFetch(_ error: Error)
}

class CharacterDetailPresenter {
    
    weak var viewController: CharacterDetailDisplaying?
    private let coordinator: CharacterDetailCoordinating
    
    init(coordinator: CharacterDetailCoordinating) {
        self.coordinator = coordinator
    }
    
}

extension CharacterDetailPresenter: CharacterDetailPresenting {
    func didFetch(_ character: CharacterDetailModel) {
        let viewModel = CharacterDetailViewModel(model: character)
        viewController?.display(viewModel)
    }
    
    func didFetch(_ error: Error) {
        viewController?.display(error.localizedDescription)
    }
}
