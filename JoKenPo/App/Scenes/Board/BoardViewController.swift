//
//  BoardViewController.swift
//  JoKenPo
//
//  Created by Diggo Silva on 24/07/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    let boardView = BoardView()
    
    override func loadView() {
        super.loadView()
        view = boardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegatesAndDataSources()
    }
    
    private func setDelegatesAndDataSources() {
        boardView.playerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

extension BoardViewController: PlayerViewDelegate {
    func rockButtonTapped() {
        boardView.resultView.yourButton.setTitle("✊🏻", for: .normal)
        print("DEBUG: Escolheu PEDRA")
    }
    
    func paperButtonTapped() {
        let resultView = ResultView()
        boardView.resultView.yourButton.setTitle("✋🏻", for: .normal)
        print("DEBUG: Escolheu PAPEL")
    }
    
    func scissorButtonTapped() {
        boardView.resultView.yourButton.setTitle("✌🏻", for: .normal)
        print("DEBUG: Escolheu TESOURA")
    }
    
    
}
