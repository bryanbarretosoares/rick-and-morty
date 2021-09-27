//
//  LoadingCell.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 27/09/21.
//

import UIKit

class LoadingCell: UITableViewCell {
    
    static let id = "loadingCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let loading = UIActivityIndicatorView()
        loading.startAnimating()
        loading.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(loading)
        
        NSLayoutConstraint.activate([
            loading.topAnchor.constraint(equalTo: contentView.topAnchor),
            loading.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            loading.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
