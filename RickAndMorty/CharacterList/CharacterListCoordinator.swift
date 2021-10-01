//
//  CharacterListCoordinator.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import UIKit

enum CharacterListCoordinatorAction {
    case goToDetail(Int)
}

protocol CharacterListCoordinating {
    var viewController: UIViewController? { get set }
    func perform(action: CharacterListCoordinatorAction)
}

class CharacterListCoordinator {
    weak var viewController: UIViewController?
    
    private func goToDetailsScreen(_ id: Int) {
        let vc = CharacterDetailFactory.make(id: id)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CharacterListCoordinator: CharacterListCoordinating {
    func perform(action: CharacterListCoordinatorAction) {
        switch action {
        case .goToDetail(let id):
            self.goToDetailsScreen(id)
        }
    }
}
