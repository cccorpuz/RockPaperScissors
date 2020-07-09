//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Crispin Corpuz on 7/6/20.
//  Copyright © 2020 Crispin Corpuz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var rockImageView: UIImageView!
    @IBOutlet weak var scissorsImageView: UIImageView!
    @IBOutlet weak var paperImageView: UIImageView!
    
    var selectionString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let rockGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedRock))
        rockImageView.addGestureRecognizer(rockGestureRecog)
        rockImageView.isUserInteractionEnabled = true
        
        let paperGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedPaper))
        paperImageView.addGestureRecognizer(paperGestureRecog)
        paperImageView.isUserInteractionEnabled = true
        
        let scissorsGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedScissors))
        scissorsImageView.addGestureRecognizer(scissorsGestureRecog)
        scissorsImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func tappedRock(_ sender: UIGestureRecognizer) {
        selectionString = "rock"
        print(selectionString)
        
    }
    
    @IBAction func tappedPaper(_ sender: UIGestureRecognizer) {
        selectionString = "paper"
        print(selectionString)
    }
    
    @IBAction func tappedScissors(_ sender: UIGestureRecognizer) {
        selectionString = "scissors"
        print(selectionString)
    }

    @IBAction func onRulesButtonPressed(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Rock_paper_scissors#:~:text=A%20player%20who%20decides%20to,%22scissors%20cuts%20paper%22).")!)
        safariViewController.delegate = self as SFSafariViewControllerDelegate
        present(safariViewController, animated: true, completion: nil)
    }
    
    
}

