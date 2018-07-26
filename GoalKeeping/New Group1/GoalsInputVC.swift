//
//  goalsInputVC.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit

class GoalsInputVC: UIViewController {

    @IBOutlet weak var inputtextView: UITextView!
    @IBOutlet weak var shortTermBtn: RoundedButton!
    @IBOutlet weak var longTermBtn: RoundedButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType : GoalType = .shortTermGoal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    
    }

   
    
    @IBAction func shortTermBtnPresses(_ sender: RoundedButton) {
        goalType = .shortTermGoal
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermButtonPressed(_ sender: RoundedButton) {
        goalType = .longTermGoal
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismissDetails()
    }
    
}
