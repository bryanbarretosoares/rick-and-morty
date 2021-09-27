//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

struct Response: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let image: String
    let gender: Gender
}
