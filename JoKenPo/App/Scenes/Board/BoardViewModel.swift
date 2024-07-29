//
//  BoardViewModel.swift
//  JoKenPo
//
//  Created by Diggo Silva on 28/07/24.
//

import Foundation

class BoardViewModel {
    var victory = 0
    var draw = 0
    var lose = 0
    
    enum Move: String {
        case rock = "✊🏻"
        case paper = "✋🏻"
        case scissors = "✌🏻"
    }

    enum GameResult {
        case win
        case draw
        case lose
    }
    
    func computerMove() -> Move {
        let randomNumber = Int.random(in: 0...2)
        
        switch randomNumber {
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
        }
    }
    
    func checkMove(userMove: Move, computerMove: Move) -> GameResult {
        if userMove == .rock && computerMove == .scissors ||
            userMove == .scissors && computerMove == .paper ||
            userMove == .paper && computerMove == .rock {
            victory += 1
            return .win
        } else if userMove == computerMove {
            draw += 1
            return.draw
        } else {
            lose += 1
            return .lose
        }
    }
}
