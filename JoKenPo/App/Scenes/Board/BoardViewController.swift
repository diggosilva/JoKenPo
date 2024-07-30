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
    
    private func userMove(userMove: String) {
        haptics()
        UIView.transition(with: self.boardView.resultView.userButton, duration: 0.3, options: .transitionFlipFromLeft) {
            self.boardView.resultView.userButton.setTitle(userMove, for: .normal)
            self.checkComputerMove()
            self.checkUserMove()
        }
    }
    
    private func checkComputerMove() {
        UIView.transition(with: self.boardView.resultView.computerButton, duration: 0.3, options: .transitionFlipFromRight) {
            let computerMove = self.viewModel.computerMove()
            self.boardView.resultView.computerButton.setTitle(computerMove.rawValue, for: .normal)
        }
    }
    
    private func checkUserMove() {
        guard let userMoveTitle = boardView.resultView.userButton.currentTitle,
              let computerMoveTitle = boardView.resultView.computerButton.currentTitle,
              let userMove = BoardViewModel.Move(rawValue: userMoveTitle),
              let computerMove = BoardViewModel.Move(rawValue: computerMoveTitle) else {
            return
        }
        
        let result = viewModel.checkMove(userMove: userMove, computerMove: computerMove)
        
        switch result {
        case .win:
            updateScoreLabel(boardView.scoreView.valueVictoryLabel, with: viewModel.victory)
        case .draw:
            updateScoreLabel(boardView.scoreView.valueDrawLabel, with: viewModel.draw)
        case .lose:
            updateScoreLabel(boardView.scoreView.valueLoseLabel, with: viewModel.lose)
        }
    }
    
    private func updateScoreLabel(_ label: UILabel, with value: Int) {
        label.text = String(value)
        
        UIView.animate(
            withDuration: 0.15,
            animations: {
                label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.15) {
                    label.transform = CGAffineTransform.identity
                }
            })
    }
}
