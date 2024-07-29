//
//  BoardViewModel.swift
//  JoKenPo
//
//  Created by Diggo Silva on 28/07/24.
//

import Foundation

class BoardViewModel {
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
    
    func checkMove(userMove: Move, computerMove: Move) -> GameResult {
        if userMove == .rock && computerMove == .scissors ||
            userMove == .scissors && computerMove == .paper ||
            userMove == .paper && computerMove == .rock {
            print("DEBUG: VITORIA")
            return .win
        } else if userMove == computerMove {
            print("DEBUG: EMPATE")
            return.draw
        } else {
            print("DEBUG: DERROTA")
            return .lose
        }
    }
}
