//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 27/09/21.
//

import UIKit

enum ImageLoaderError: Error {
    case unexpected
}

class ImageLoader {
    private var runningRequests: [UUID: URLSessionDataTask] = [:]
    private var loadedImages: [String: UIImage] = [:]
    
    func cancelRequest(_ uuid: UUID) {
        self.runningRequests[uuid]?.cancel()
    }
    
    func loadImage(url: String, completion: @escaping (Result<UIImage, ImageLoaderError>) -> Void) -> UUID? {
        
        if let image = loadedImages[url] {
            completion(.success(image))
            return nil
        }
        
        let uuid = UUID()
        
        guard let _url = URL(string: url) else {
            handleResult(completion: completion, result: .failure(.unexpected))
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: _url) { data, _, _ in
            
            defer {
                self.runningRequests.removeValue(forKey: uuid)
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                self.handleResult(completion: completion, result: .failure(.unexpected))
                return
            }
            
            self.loadedImages[url] = image
            self.handleResult(completion: completion, result: .success(image))
        }
        
        task.resume()
        self.runningRequests[uuid] = task
        return uuid
    }
    
    private func handleResult(completion: @escaping (Result<UIImage, ImageLoaderError>) -> Void, result: Result<UIImage, ImageLoaderError>) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
