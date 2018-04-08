//
//  ViewController.swift
//  TicTacToe
//
//  Created by Anton Filipović on 03/04/2018.
//  Copyright © 2018 Anton Filipović. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game: Game = Game()
    //I was not able to add all buttons to IBOutletCollection at once; ask why
    @IBOutlet var gameTiles: [UIButton]!
    @IBOutlet weak var gameStateLbl: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonPressed(_ sender: UIButton) {
        game = Game()
        for button in gameTiles {
            button.isEnabled = true
            button.setTitle("", for: .normal)
        }
        displayPlayer()
        sender.setTitle("RESET", for: .normal)
    }
    
    @IBAction func titleButtonTap(_ sender: UIButton) {
        let tag = sender.tag
        let row = tag / 10 - 1
        let col = tag % 10 - 1
        sender.setTitle(game.currentPlayer.rawValue, for: .normal)
        sender.isEnabled = false
        game.nextMove(row: row, col: col)
        if let result = game.result
        {
            gameEnded(result: result)
        }
        else {
            displayPlayer()
        }
        
    }
    
    func displayPlayer() {
        gameStateLbl.text = "Na redu je igrac " + game.currentPlayer.rawValue
    }
    
    func gameEnded(result: Result) {
        switch result {
        case Result.tie:
            gameStateLbl.text = "Izjednačeno je!"
        case .win(let player):
            gameStateLbl.text = "Igrač " + player.rawValue + " je pobijedio!"
        }
        
        for button in gameTiles {
            button.isEnabled = false
        }
        resetButton.setTitle("Nova igra", for: .normal)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
