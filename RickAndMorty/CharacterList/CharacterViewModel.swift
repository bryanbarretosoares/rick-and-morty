//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 25/09/21.
//

import UIKit

struct CharacterViewModel {
    
    private let model: Character
    
    init(model: Character) {
        self.model = model
    }
    
    var name: String {
        return model.name.capitalized
    }
    
    var url: String {
        return model.image
    }
    
    private var specie: String {
        return model.species
    }
    
    private var gender: String {
        return model.gender.rawValue
    }
    
    var characterDetail: NSAttributedString {
        
        let genderAttrString = NSAttributedString(string: specie, attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .semibold)])
        let specieAttrString = NSAttributedString(string: " \(gender)", attributes: [.font:UIFont.systemFont(ofSize: 15, weight: .ultraLight)])
        
        let finalString = NSMutableAttributedString()
        finalString.append(genderAttrString)
        finalString.append(specieAttrString)
        
        return finalString
    }
    
    var borderColor: UIColor {
        switch model.status {
        case .alive:
            return .systemGreen
        case .dead:
            return .systemRed
        case .unknown:
            return .systemOrange
        }
    }
}
