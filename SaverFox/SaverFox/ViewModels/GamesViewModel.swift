//
//  GamesViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 09.01.24.
//

import Foundation

class GamesViewModel: ObservableObject {
    
    init() {
        
        filterGames()
    }
    
    // MARK: - Variables
    
    private var games = [
        Game(cover: "rock_paper_scissors", name: Strings.rockPaperScissors, pointValue: 5),
        Game(cover: "tic_tac_toe", name: Strings.ticTacToe, pointValue: 10),
        Game(cover: "hangman", name: Strings.hangman, pointValue: 20),
        Game(cover: "trickle", name: Strings.trickle, pointValue: 20)
    ]
    
    @Published var twentyPointsGame: [Game] = []
    @Published var fifteenPointsGame: [Game] = []
    @Published var tenPointsGame: [Game] = []
    @Published var fivePointsGame: [Game] = []
    
    // MARK: - Functions
    
    func filterGames() {
        
        for game in games {
            if game.pointValue == 20 {
                twentyPointsGame.append(game)
            } else if game.pointValue == 15 {
                fifteenPointsGame.append(game)
            } else if game.pointValue == 10 {
                tenPointsGame.append(game)
            } else if game.pointValue == 5 {
                fivePointsGame.append(game)
            }
        }
    }
}
