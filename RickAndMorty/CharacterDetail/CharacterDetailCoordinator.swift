//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import UIKit

protocol CharacterDetailCoordinating {
    var viewController: UIViewController? { get }
}

class CharacterDetailCoordinator {
    weak var viewController: UIViewController?
}

extension CharacterDetailCoordinator: CharacterDetailCoordinating {
    
}
