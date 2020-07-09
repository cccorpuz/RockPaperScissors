//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Crispin Corpuz on 7/7/20.
//  Copyright © 2020 Crispin Corpuz. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController
{
    @IBOutlet weak var userChoiceImage: UIImageView!
    @IBOutlet weak var computerChoiceImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    /*
     This IBAction is to return to the main screen by popping the second ViewController
     off of the navigation "stack"
     */
    @IBAction func tryAgainButtonPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        // put code here
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if( didWin )
        {
            resultLabel.text? = "You won! Congrats!"
        }
        else if (didTie)
        {
            resultLabel.text? = "You tied. Try again..."
        }
        else
        {
            resultLabel.text? = "You lost. Better luck next time!"
        }
        userChoiceImage.image = UIImage(named: userChoice)
        computerChoiceImage.image = UIImage(named: compChoice)
    }
}
