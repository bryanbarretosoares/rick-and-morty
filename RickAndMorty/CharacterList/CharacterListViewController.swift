//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import UIKit

protocol CharacterListDisplaying: AnyObject {
    
}

class CharacterListViewController: UIViewController {
    
    private let interactor: CharacterListInteracting
    
    init(interactor: CharacterListInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CharacterListViewController: CharacterListDisplaying {
    
}
