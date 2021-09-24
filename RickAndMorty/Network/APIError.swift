//
//  APIError.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

enum APIError: LocalizedError {
    case url
    case empty
    case server(Error)
    case parse(Error)
    
    var errorDescription: String? {
        switch self {
        case .url:
            return "Erro ao montar URL"
        case .empty:
            return "Nenhum dado retornado do servidor"
        case .server(let error):
            return "Erro na requisição:\n\(error.localizedDescription)"
        case .parse(let error):
            return "Erro ao converter objeto:\n\(error.localizedDescription)"
        }
    }
}
