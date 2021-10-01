//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import UIKit

enum CharacterDetailFactory {
    static func make(id: Int) -> UIViewController {
        let coordinator = CharacterDetailCoordinator()
        let service = CharacterDetailService()
        let presenter = CharacterDetailPresenter(coordinator: coordinator)
        let interactor = CharacterDetailInteractor(id: id, presenter: presenter, service: service)
        let viewController = CharacterDetailViewController(interactor: interactor)
        
        presenter.viewController = viewController
        coordinator.viewController = viewController
        
        return viewController
    }
}
