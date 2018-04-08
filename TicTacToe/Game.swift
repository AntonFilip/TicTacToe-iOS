//
//  Game.swift
//  TicTacToe
//
//  Created by Anton Filipović on 03/04/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import Foundation

class Game {
    
    var currentPlayer: Player
    private var positionsPlayerX: [[Bool]]
    private var positionsPlayerO: [[Bool]]
    private var gameTilesStates: [[TileState]]
    
    var result: Result? {
        get {
            if (positionsPlayerX[0][0] && positionsPlayerX[0][1] && positionsPlayerX[0][2]
                || positionsPlayerX[1][0] && positionsPlayerX[1][1] && positionsPlayerX[1][2]
                || positionsPlayerX[2][0] && positionsPlayerX[2][1] && positionsPlayerX[2][2]
                || positionsPlayerX[0][0] && positionsPlayerX[1][0] && positionsPlayerX[2][0]
                || positionsPlayerX[0][1] && positionsPlayerX[1][1] && positionsPlayerX[2][1]
                || positionsPlayerX[0][2] && positionsPlayerX[1][2] && positionsPlayerX[2][2]
                || positionsPlayerX[0][0] && positionsPlayerX[1][1] && positionsPlayerX[2][2]
                || positionsPlayerX[0][2] && positionsPlayerX[1][1] && positionsPlayerX[2][0]){
                return Result.win(Player.X)
            }
            if (positionsPlayerO[0][0] && positionsPlayerO[0][1] && positionsPlayerO[0][2]
                || positionsPlayerO[1][0] && positionsPlayerO[1][1] && positionsPlayerO[1][2]
                || positionsPlayerO[2][0] && positionsPlayerO[2][1] && positionsPlayerO[2][2]
                || positionsPlayerO[0][0] && positionsPlayerO[1][0] && positionsPlayerO[2][0]
                || positionsPlayerO[0][1] && positionsPlayerO[1][1] && positionsPlayerO[2][1]
                || positionsPlayerO[0][2] && positionsPlayerO[1][2] && positionsPlayerO[2][2]
                || positionsPlayerO[0][0] && positionsPlayerO[1][1] && positionsPlayerO[2][2]
                || positionsPlayerO[0][2] && positionsPlayerO[1][1] && positionsPlayerO[2][0]){
                return Result.win(Player.O)
            }
            for tileStateArray in gameTilesStates {
                for tileState in tileStateArray {
                    switch tileState {
                    case .Occupied:
                        break
                    case .Empty:
                        return nil
                    }
                }
            }
            return Result.tie
        }
    }
    
    init() {
        gameTilesStates = [[TileState.Empty, TileState.Empty, TileState.Empty],
                            [TileState.Empty, TileState.Empty, TileState.Empty],
                            [TileState.Empty, TileState.Empty, TileState.Empty]]
        positionsPlayerX = [[false, false, false],
                           [false, false, false],
                           [false, false, false]]
        positionsPlayerO = [[false, false, false],
                            [false, false, false],
                            [false, false, false]]
        currentPlayer = arc4random() % 2 == 0 ? Player.O : Player.X
    }
    
    func nextMove(row: Int, col: Int) {
        gameTilesStates[row][col] = TileState.Occupied(currentPlayer)
        switch currentPlayer {
        case Player.X:
            positionsPlayerX[row][col] = true
        case Player.O:
            positionsPlayerO[row][col] = true
        }
        currentPlayer = currentPlayer == Player.X ? Player.O : Player.X
    }
    
}
