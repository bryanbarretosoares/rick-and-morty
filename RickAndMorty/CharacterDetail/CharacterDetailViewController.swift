//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import UIKit

protocol CharacterDetailDisplaying: AnyObject {
    func display(_ error: String)
    func display(_ characterDetail: CharacterDetailViewModel)
}

class CharacterDetailViewController: UIViewController {
    
    private let interactor: CharacterDetailInteracting
    
    private lazy var loading: UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView()
        ac.hidesWhenStopped = true
        ac.startAnimating()
        ac.backgroundColor = .red
        return ac
    }()
    
    init(interactor: CharacterDetailInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        interactor.fetchCharacterDetail()
    }
}

extension CharacterDetailViewController: CharacterDetailDisplaying {
    func display(_ error: String) {
        print(error)
    }
    
    func display(_ characterDetail: CharacterDetailViewModel) {
        print(characterDetail.name)
    }
}

extension CharacterDetailViewController: ViewCoding {
    func setupConstraints() {
        loading.frame = view.frame
    }
    
    func viewHierarchy() {
        view.addSubview(loading)
    }
    
    func configureViews() {
        view.backgroundColor = .systemBackground
        title = "Details"
    }
}
