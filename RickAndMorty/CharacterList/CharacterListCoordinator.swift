//
//  CharacterListCoordinator.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import UIKit

protocol CharacterListCoordinating {
    var viewController: UIViewController? { get set }
}

class CharacterListCoordinator {
    weak var viewController: UIViewController?
}

extension CharacterListCoordinator: CharacterListCoordinating {
    
}
