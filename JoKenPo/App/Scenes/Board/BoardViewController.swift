//
//  BoardViewController.swift
//  JoKenPo
//
//  Created by Diggo Silva on 24/07/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    private let boardView = BoardView()
    
    override func loadView() {
        super.loadView()
        view = boardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}
