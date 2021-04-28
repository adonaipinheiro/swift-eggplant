//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Adonai Junio Pinheiro on 28/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var caloriasTextField: UITextField?
    
    // MARK: - Atributos
    var delegate: AdicionaItensDelegate?
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nomeComplemento = nomeTextField?.text, let caloriasComplemento = caloriasTextField?.text, let numeroCalorias = Double(caloriasComplemento) else { return }

        
        let item = Item(nome: nomeComplemento, calorias: numeroCalorias)
        
        delegate?.add(item)
        
        navigationController?.popViewController(animated: true)
    }
}
