//
//  goalsInputVC.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit

class GoalsInputVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var inputtextView: UITextView!
    @IBOutlet weak var shortTermBtn: RoundedButton!
    @IBOutlet weak var longTermBtn: RoundedButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType : GoalType = .shortTermGoal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputtextView.delegate = self
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    
    }

   
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputtextView.text = ""
        inputtextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        if inputtextView.text != "" && inputtextView.text != "What is your goal?"{
            guard let finishedGoalsVC = storyboard?.instantiateViewController(withIdentifier: "FinishedGoalVC") as? FinishGoalVC else { return }
            finishedGoalsVC.initData(description: inputtextView.text!, goalType: goalType)
            presentingViewController?.presentSecondaryVC(finishedGoalsVC)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismissDetails()
    }
    
}
