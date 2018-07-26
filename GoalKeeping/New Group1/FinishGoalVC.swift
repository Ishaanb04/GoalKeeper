//
//  FinishGoalVC.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate{

    var goalDescription : String!
    var goalType : GoalType!
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        createGoalButton.bindToKeyboard()
    }
    
    func initData(description : String , goalType : GoalType){
        self.goalDescription = description
        self.goalType = goalType
    }


    
    @IBAction func createGoalPressed(_ sender: UIButton) {
        if pointsTextField.text != "" && pointsTextField.text != "0"{
            self.save { (completion) in
                if completion{
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismissDetails()
    }
    
    func save(completion: (_ finished : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDistription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalNumberToComplete = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
        }catch{
            debugPrint(error)
            completion(false)
        }
        
    }
    
}

