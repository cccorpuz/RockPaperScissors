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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onRulesButtonPressed(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Rock_paper_scissors#:~:text=A%20player%20who%20decides%20to,%22scissors%20cuts%20paper%22).")!)
        safariViewController.delegate = self as SFSafariViewControllerDelegate
        present(safariViewController, animated: true, completion: nil)
    }
    
    
}

