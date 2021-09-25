//
//  CharacterListFactory.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import UIKit

enum CharacterListFactory {
    static func make() -> UIViewController {
        let service = CharacterListService()
        let coordinator = CharacterListCoordinator()
        
        let presenter = CharacterListPresenter(coordinator: coordinator)
        let interactor = CharacterListInteractor(service: service, presenter: presenter)
        let viewController = CharacterListViewController(interactor: interactor)
        
        presenter.viewController = viewController
        coordinator.viewController = viewController
        
        return viewController
    }
}
