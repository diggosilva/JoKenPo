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
        checkMove()
    }
    
    func paperButtonTapped() {
        boardView.resultView.yourButton.setTitle("✋🏻", for: .normal)
        checkMove()
    }
    
    func scissorButtonTapped() {
        boardView.resultView.yourButton.setTitle("✌🏻", for: .normal)
        checkMove()
    }
    
    func checkMove() {
        // Victory
        
        if boardView.resultView.yourButton.currentTitle == "✊🏻" && boardView.resultView.computerButton.currentTitle == "✌🏻" ||
            boardView.resultView.yourButton.currentTitle == "✌🏻" && boardView.resultView.computerButton.currentTitle == "✋🏻" ||
            boardView.resultView.yourButton.currentTitle == "✋🏻" && boardView.resultView.computerButton.currentTitle == "✊🏻" {
            
            print("DEBUG: Você ganhou!")
            
            // Draw
        } else if boardView.resultView.yourButton.currentTitle == "✊🏻" && boardView.resultView.computerButton.currentTitle == "✊🏻" ||
                    boardView.resultView.yourButton.currentTitle == "✌🏻" && boardView.resultView.computerButton.currentTitle == "✌🏻" ||
                    boardView.resultView.yourButton.currentTitle == "✋🏻" && boardView.resultView.computerButton.currentTitle == "✋🏻" {
                    
                    print("DEBUG: Empate!")
        } else {
            
            print("DEBUG: Você perdeu!")
        }
    }
}
