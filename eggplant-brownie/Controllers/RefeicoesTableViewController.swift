//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Adonai Junio Pinheiro on 23/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddRefeicaoDelegate {
    
    // MARK: - Atributos
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Salada", felicidade: 4)]
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        cell.textLabel?.text = refeicao.getNome()
        
        return cell
    }
    
    // MARK: - Metodos
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            if let viewController = segue.destination as? AddRefeicaoController {
                viewController.delegate = self
            }
        }
    }
    
}
