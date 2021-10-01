//
//  CharacterDetailModel.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 30/09/21.
//

import Foundation

struct CharacterDetailModel: Decodable {
    let id: Int
    let name: String
    let status: Status
    let gender: Gender
    let origin: Origin
    let location: Origin
    let image: String
    let url: String
    let created: String
}

struct Origin: Decodable {
    let name: String
}
