//
//  Network.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    let session: URLSession
    
    private init() {
        self.session = URLSession.shared
    }
    
    func fetch<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T,APIError>) -> Void) {
        guard let url = buildURL(endpoint: endpoint).url else {
            completion(.failure(.url))
            return
        }

        let request = buildRequest(url: url, endpoint: endpoint)
        
        let task = session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(.server(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.empty))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.parse(error)))
            }
        }
        
        task.resume()
    }
    
    private func buildRequest(url: URL, endpoint: Endpoint) -> URLRequest {
        
        // cria request e seta o metodo http
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // adiciona body caso não seja get
        if endpoint.method != .get {
            request.httpBody = endpoint.body
        }
        
        // adiciona os headers
        for header in endpoint.headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
    
    private func buildURL(endpoint: Endpoint) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        urlComponents.queryItems = []
        
        for param in endpoint.params {
            let queryItem = URLQueryItem(name: param.key, value: param.value)
            urlComponents.queryItems?.append(queryItem)
        }
        debugPrint("\n\n💀 URL: \(String(describing: urlComponents.url?.absoluteString))\n\n")
        return urlComponents
    }
}
