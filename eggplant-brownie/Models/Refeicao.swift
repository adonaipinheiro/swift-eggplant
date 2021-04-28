//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 16/03/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    
    private let nome: String
    private let felicidade: Int
    private var itens: Array<Item> = []
    
    // MARK: - Init
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func getNome() -> String {
        return self.nome
    }
    
    func getFelicidade() -> Int {
        return self.felicidade
    }
}
