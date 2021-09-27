//
//  CharacterListCell.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 27/09/21.
//

import UIKit

class CharacterListCell: UITableViewCell {
    
    static let id = "characterCell"
    
    var uuid: UUID?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, detailLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 16
        stack.setCustomSpacing(0, after: nameLabel)
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var characterImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.borderWidth = 5
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var cellBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.alpha = 0.8
        return view
    }()
    
    private lazy var cellBackgroundImageview: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(characterViewModel viewModel: CharacterViewModel) {
        nameLabel.text = viewModel.name
        detailLabel.attributedText = viewModel.characterDetail
        uuid = characterImageView.loadImage(from: viewModel.url)
        uuid = cellBackgroundImageview.loadImage(from: viewModel.url)
        characterImageView.layer.borderColor = viewModel.borderColor.cgColor
        characterImageView.layer.cornerRadius = 50
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if let uuid = uuid {
            characterImageView.cancel(uuid: uuid)
        }
    }
}

extension CharacterListCell: ViewCoding {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.heightAnchor.constraint(equalToConstant: 100),
            characterImageView.widthAnchor.constraint(equalToConstant: 100),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            textStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textStack.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            textStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            cellBackgroundImageview.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellBackgroundImageview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellBackgroundImageview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellBackgroundImageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        cellBackground.frame = cellBackgroundImageview.frame
    }
    
    func viewHierarchy() {
        contentView.addSubview(cellBackgroundImageview)
        contentView.addSubview(cellBackground)
        contentView.addSubview(textStack)
        contentView.addSubview(characterImageView)
    }
}
