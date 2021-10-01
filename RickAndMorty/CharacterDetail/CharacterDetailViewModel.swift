//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 01/10/21.
//

import Foundation

struct CharacterDetailViewModel {
    
    private let model: CharacterDetailModel
    
    init(model: CharacterDetailModel) {
        self.model = model
    }
    
    var name: String {
        return model.name
    }
}
