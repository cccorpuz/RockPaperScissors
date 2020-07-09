//
//  UserChoice.swift
//  RockPaperScissors
//
//  Created by Crispin Corpuz on 7/8/20.
//  Copyright © 2020 Crispin Corpuz. All rights reserved.
//

import Foundation

/*
 Global Variables
 */
var choices : [String] = ["rock", "paper", "scissors"]
var userChoice : String = ""
var compChoice : String = ""
var userSelected : Bool = false
var didWin : Bool = false
var didTie : Bool = false
/*
 Class definition for encapsulating choices
 */
func Choice (uc : Int) -> Void
{
    let compIndex : Int = Int.random(in: 0..<3)
    userChoice = choices[uc]
    compChoice = choices[compIndex]
    print("Choice made!")
    /*
     Check who won the match
     */
    if ( uc == 2 && compIndex == 0 )
    {
        didWin = false
    }
    else if ( uc == 0 && compIndex == 2 )
    {
        didWin = true
    }
    else if ( uc > compIndex )
    {
        didWin = true
    }
    else if ( uc == compIndex )
    {
        didTie = true
    }
    userSelected = true
}
