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
}

class CharacterListInteractor {
    
    private let service: CharacterListServicing
    private let presenter: CharacterListPresenting
    
    private var isLoading = false
    private var page: Int = 1
    
    init(service: CharacterListServicing, presenter: CharacterListPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

extension CharacterListInteractor: CharacterListInteracting {
    func fetchCharacter() {
        
        isLoading = true
        
        service.fetch(page: self.page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
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
        
//        Condicional para parar de carregar na página 3 e exibir a célula de loading
        if page == 3 {
            return
        }
        
        if !isLoading {
            fetchCharacter()
        }
    }
}
