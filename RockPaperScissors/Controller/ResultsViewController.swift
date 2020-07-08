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
    @IBAction func tryAgainButtonPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        // put code here
    }
}
