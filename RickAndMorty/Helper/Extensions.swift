//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 27/09/21.
//

import UIKit

extension UIImageView {
    
    var imageLoader: ImageLoader {
        return ImageLoader()
    }
    
    func loadImage(from url: String) -> UUID? {
        let uuid = imageLoader.loadImage(url: url) { result in
            switch result {
            case .success(let image):
                self.image = image
            case .failure(_):
                self.image = UIImage(systemName: "nosign")
            }
        }
        
        return uuid
    }
    
    func cancel(uuid: UUID) {
        imageLoader.cancelRequest(uuid)
        self.image = nil
    }
}
