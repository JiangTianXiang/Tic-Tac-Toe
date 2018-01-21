//
//  ViewController.swift
//  TicTacToe
//
//  Created by lin on 18/1/19.
//  Copyright © 2018年 JasonJiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1;//Cross player
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombo = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var drawCase = 0;
    var gameActive = true;
   
    @IBOutlet weak var Prompt: UILabel!
    @IBAction func Action(sender: AnyObject)
    {
        if (gameState[sender.tag - 1] == 0 && gameActive == true)
        {
            drawCase++;
            gameState[sender.tag - 1] = activePlayer
            if(activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), forState: UIControlState())
                activePlayer = 2;
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), forState: UIControlState())
                activePlayer = 1;
            }
        }
        
        for i in winningCombo
        {
            if gameState[i[0]] != 0 && gameState[i[0]] == gameState[i[1]] && gameState[i[2]] == gameState[i[0]]
            {
                gameActive = false;
                
                if gameState[i[0]] == 2
                {
                    Prompt.text = "winner is player 2 with O"
                }
                else if gameState[i[0]] == 1
                {
                    Prompt.text = "winner is player 1 with X"
                }
                
                playAgain.hidden = false
                Prompt.hidden = false
            }
        }
        
        if drawCase == 9
        {
            Prompt.text = "Draw"
            gameActive = false;
            playAgain.hidden = false
            Prompt.hidden = false
        }
    }
    
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgain(sender: AnyObject)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameActive = true;
        activePlayer = 1;
        drawCase = 0;
        
        playAgain.hidden = true
        Prompt.hidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState:UIControlState())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

