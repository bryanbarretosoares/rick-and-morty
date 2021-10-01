//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Bryan Barreto Soares on 24/09/21.
//

import UIKit

protocol CharacterListDisplaying: AnyObject {
    func display(characters: [CharacterViewModel])
    func display(message: String)
}

class CharacterListViewController: UIViewController {
    
    private let interactor: CharacterListInteracting
    private var characters: [CharacterViewModel] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(CharacterListCell.self, forCellReuseIdentifier: CharacterListCell.id)
        table.register(LoadingCell.self, forCellReuseIdentifier: LoadingCell.id)
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    init(interactor: CharacterListInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
        interactor.fetchCharacter()
    }
}

extension CharacterListViewController: CharacterListDisplaying {
    
    func display(characters: [CharacterViewModel]) {
        self.characters.append(contentsOf: characters)
        tableView.reloadData()
    }
    
    func display(message: String) {
        print(message)
    }
}

extension CharacterListViewController: ViewCoding {
    
    func setupConstraints() {
        tableView.frame = view.frame
    }
    
    func viewHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureViews() {
        title = "Characters"
    }
}

extension CharacterListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == characters.count {
            return LoadingCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCell.id, for: indexPath) as? CharacterListCell else {
            return UITableViewCell()
        }
        
        let characterViewModel = characters[indexPath.row]
        cell.config(characterViewModel: characterViewModel)
        return cell
    }
}

extension CharacterListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.tapCharacter(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        Caso falte apenas 5 itens para serem mostrados, carrega mais dados
        if indexPath.row == self.characters.count - 5 {
            interactor.fetchMore()
        }
    }
}
