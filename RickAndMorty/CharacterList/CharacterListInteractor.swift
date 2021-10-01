//
//  CharacterListInteractor.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

protocol CharacterListInteracting {
    func fetchCharacter()
    func fetchMore()
    func tapCharacter(at index: Int)
}

class CharacterListInteractor {
    
    private let service: CharacterListServicing
    private let presenter: CharacterListPresenting
    
    private var isLoading = false
    private var page: Int = 1
    
    private var characters: [Character] = []
    
    init(service: CharacterListServicing, presenter: CharacterListPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

extension CharacterListInteractor: CharacterListInteracting {
    func tapCharacter(at index: Int) {
        let id = characters[index].id
        presenter.presentDetailScreen(with: id)
    }
    
    func fetchCharacter() {
        
        isLoading = true
        
        service.fetch(page: self.page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.characters.append(contentsOf: response.results)
                    self?.presenter.didFetch(response.results)
                    self?.page += 1
                case .failure(let error):
                    self?.presenter.didFetch(error)
                }
            }
            
            self?.isLoading = false
        }
    }
    
    func fetchMore() {
        if !isLoading {
            fetchCharacter()
        }
    }
}
