//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Adonai Pinheiro on 28/04/2021.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

protocol AddRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class AddRefeicaoController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - Atributos
    var delegate: AddRefeicaoDelegate?
    var items: [Item] = [Item(nome: "Molho de Tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 40.0),
                         Item(nome: "Molho apimentado", calorias: 40.0),
                         Item(nome: "Manjericão", calorias: 40.0),]
    var selectedItems: [Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let buttonAddItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        
        navigationItem.rightBarButtonItem = buttonAddItem
    }
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        items.append(item)
        itensTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row].nome
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            selectedItems.append(items[indexPath.row])
        } else {
            cell.accessoryType = .none
            let item = items[indexPath.row]
            if let position = selectedItems.index(of: item) {
                selectedItems.remove(at: position)
            }
            
        }
    }
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: selectedItems)
        
        print("comi \(refeicao.getNome()) e fiquei com felicidade: \(refeicao.getFelicidade())")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
    
}

