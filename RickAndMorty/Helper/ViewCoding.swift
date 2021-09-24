//
//  ViewCoding.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import Foundation

protocol ViewCoding {
    func buildLayout()
    func configureViews()
    func setupConstraints()
    func viewHierarchy()
}

extension ViewCoding {
    func buildLayout() {
        viewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() { }
}
