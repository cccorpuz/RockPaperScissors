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
    
    var timer = Timer()
    var countdown = 3

    @IBOutlet weak var countdownTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onRulesButtonPressed(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Rock_paper_scissors#:~:text=A%20player%20who%20decides%20to,%22scissors%20cuts%20paper%22).")!)
        safariViewController.delegate = self as SFSafariViewControllerDelegate
        present(safariViewController, animated: true, completion: nil)
    }
    
    @IBAction func onTimerPressed(_ sender: Any) {
        //Stops the timer if it's already going
        timer.invalidate()
        
        //Starts a timer that will count down to 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: self, repeats: true)
    }
    
    @objc func timerAction() {
        if countdown != 0 {
            countdown -= 1
            countdownTimer.text = "\(countdown)"
        }
        else {
            countdown = 3
            countdownTimer.text = "\(countdown)"
            
            let alert = UIAlertController(title: "Timer Ended", message: "Make sure to choose an option before time runs out.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
            timer.invalidate()
        }
    }
}

