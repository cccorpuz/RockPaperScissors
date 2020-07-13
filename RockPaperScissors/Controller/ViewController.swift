//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Crispin Corpuz on 7/6/20.
//  Copyright © 2020 Crispin Corpuz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    /*
     Global Variables
     */
    @IBOutlet weak var rockImageView: UIImageView!
    @IBOutlet weak var scissorsImageView: UIImageView!
    @IBOutlet weak var paperImageView: UIImageView!
    @IBOutlet weak var countdownTimer: UILabel!
    
    var timer = Timer()
    var countdown = 3
    var selectionString : String = ""
    
    let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } // end viewDidLoad()

    /*
     Below is the code for gesture recognizer
     */
    
    override func viewWillAppear(_ animated: Bool)
    {
  
        // Single Tap Gesture Recognizers
        let oneRockGestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.oneTappedRock))
        oneRockGestureRecog.numberOfTapsRequired = 1

        let onePaperGestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.oneTappedPaper))
        onePaperGestureRecog.numberOfTapsRequired = 1

        let oneScissorsGestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.oneTappedScissors))
        oneScissorsGestureRecog.numberOfTapsRequired = 1
        
        // Double Tap Gesture Recognizers
        let twoRockGestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.twoTappedRock))
        twoRockGestureRecog.numberOfTapsRequired = 2
        
        let twoPaperGestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.twoTappedPaper))
        twoPaperGestureRecog.numberOfTapsRequired = 2
        
        let twoScissorsGestureRecog = UITapGestureRecognizer(target: self, action: #selector(self.twoTappedScissors))
        twoScissorsGestureRecog.numberOfTapsRequired = 2
        
        // Rock
        rockImageView.addGestureRecognizer(oneRockGestureRecog)
        rockImageView.addGestureRecognizer(twoRockGestureRecog)
        rockImageView.isUserInteractionEnabled = true
        
        // Paper
        paperImageView.addGestureRecognizer(onePaperGestureRecog)
        paperImageView.addGestureRecognizer(twoPaperGestureRecog)
        paperImageView.isUserInteractionEnabled = true
        
        // Scissors
        scissorsImageView.addGestureRecognizer(oneScissorsGestureRecog)
        scissorsImageView.addGestureRecognizer(twoScissorsGestureRecog)
        scissorsImageView.isUserInteractionEnabled = true
        
        // Enforcing priority of gestures
        twoRockGestureRecog.shouldRequireFailure(of: oneRockGestureRecog)
        twoPaperGestureRecog.shouldRequireFailure(of: onePaperGestureRecog)
        twoScissorsGestureRecog.shouldRequireFailure(of: oneScissorsGestureRecog)
    } // end viewWillAppear()
    
     /*
     Gesture Recognizer functions
     */
    @IBAction func oneTappedRock(_ sender: UIGestureRecognizer)
    {
        Choice(uc: 0)
        print("Your choice:" + userChoice)
        print("Comp choice:" + compChoice)
    } // end oneTappedRock()

    @IBAction func oneTappedPaper(_ sender: UIGestureRecognizer)
    {
        Choice(uc: 1)
        print("Your choice:" + userChoice)
        print("Comp choice:" + compChoice)
    } // end oneTappedPaper()

    @IBAction func oneTappedScissors(_ sender: UIGestureRecognizer)
    {
        Choice(uc: 2)
        print("Your choice:" + userChoice)
        print("Comp choice:" + compChoice)
    } // end oneTappedScissors()
    
    @IBAction func twoTappedRock(_ sender: UIGestureRecognizer)
    {
        Choice(uc: 0)
        print("Your choice:" + userChoice)
        print("Comp choice:" + compChoice)
    } // end twoTappedPaper()
    
    @IBAction func twoTappedPaper(_ sender: UIGestureRecognizer)
    {
        Choice(uc: 1)
        print("Your choice:" + userChoice)
        print("Comp choice:" + compChoice)
    } // end twoTappedpaper()
    
    @IBAction func twoTappedScissors(_ sender: UIGestureRecognizer)
    {
        Choice(uc: 2)
        print("Your choice:" + userChoice)
        print("Comp choice:" + compChoice)
    } // end twoTappedScissors()

    /*
     Below is the code that allows for the SFSafariViewController to open wikipedia
     */
    @IBAction func onRulesButtonPressed(_ sender: Any)
    {
        let safariViewController = SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Rock_paper_scissors#:~:text=A%20player%20who%20decides%20to,%22scissors%20cuts%20paper%22).")!)
        safariViewController.delegate = self as SFSafariViewControllerDelegate
        present(safariViewController, animated: true, completion: nil)
    } // end onRulesButtonPressed
    
    @IBAction func onTimerPressed(_ sender: Any)
    {
        print("Timer pressed")
        timer.invalidate()
        //Starts a timer that will count down to 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: self, repeats: true)
    } // end onTimerPressed()
    
    @objc func timerAction() {
        if (countdown != 0)
        {
            countdown -= 1
            countdownTimer.text = "\(countdown)"
            if (userSelected)
            {
                // Going to results
                let resultsView  = mainStoryboard.instantiateViewController(withIdentifier: "ResultsView") as! ResultsViewController
                self.navigationController?.pushViewController(resultsView, animated: true)
                print("Went to Results View")
                
                // Resetting
                userSelected = false
                countdown = 3
                countdownTimer.text = "\(countdown)"
                timer.invalidate()
            }
        }
        else
        {
            countdown = 3
            countdownTimer.text = "\(countdown)"
            
            let alert = UIAlertController(title: "Timer Ended", message: "Make sure to choose an option before time runs out.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
            timer.invalidate()
        }
    } // End timerAction()
    
    let altRock = UIImage(named: "AlternativeImages/bigrock")
    let altPaper = UIImage(named: "AlternativeImages/bigpaper")
    let altScissors = UIImage(named: "AlternativeImages/bigscissors")
    
    /* Function to access images in photo library
    func selectImage(tap: UITapGestureRecognizer) {

        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.present(imagePicker, animated: true, completion: nil)
        

        // Identify image view that was tapped:
        guard let viewTappedTag = tap.view?.tag else {return}
        self.selectedImageView = imageViews[viewTappedTag - 1]
        // Person on stack overflow named their image views "imageView" + number... how do we identify which image was picked? 

    } */
    
    
    
} // End ViewController.swift

