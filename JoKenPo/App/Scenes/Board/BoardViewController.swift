//
//  BoardViewController.swift
//  JoKenPo
//
//  Created by Diggo Silva on 24/07/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    let boardView = BoardView()
    let viewModel = BoardViewModel()
    
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
        userMove(userMove: "✊🏻")
    }
    
    func paperButtonTapped() {
        userMove(userMove: "✋🏻")
    }
    
    func scissorButtonTapped() {
        userMove(userMove: "✌🏻")
    }
    
    func userMove(userMove: String) {
        UIView.transition(with: self.boardView.resultView.yourButton, duration: 0.25, options: .transitionFlipFromRight) {
            self.boardView.resultView.yourButton.setTitle(userMove, for: .normal)
            self.checkComputerMove()
            self.checkUserMove()
        }
    }
    
    func checkComputerMove() {
        UIView.transition(with: self.boardView.resultView.computerButton, duration: 0.25, options: .transitionFlipFromRight) {
            let computerMove = self.viewModel.computerMove()
            self.boardView.resultView.computerButton.setTitle(computerMove.rawValue, for: .normal)
        }
    }
    
    func checkUserMove() {
        guard let userMoveTitle = boardView.resultView.yourButton.currentTitle,
              let computerMoveTitle = boardView.resultView.computerButton.currentTitle,
              let userMove = BoardViewModel.Move(rawValue: userMoveTitle),
              let computerMove = BoardViewModel.Move(rawValue: computerMoveTitle) else {
            return
        }
        
        let result = viewModel.checkMove(userMove: userMove, computerMove: computerMove)
        
        switch result {
        case .win:
            self.boardView.scoreView.valueVictoryLabel.text = String(self.viewModel.victory)
            print("DEBUG: Venceu")
        case .draw:
            self.boardView.scoreView.valueDrawLabel.text = String(self.viewModel.draw)
            print("DEBUG: Empatou")
        case .lose:
            self.boardView.scoreView.valueLoseLabel.text = String(self.viewModel.lose)
            print("DEBUG: Perdeu")
        }
    }
}
