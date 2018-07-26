//
//  GoalCell.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/26/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalDiscription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    @IBOutlet weak var completeGoalView: UIView!
    
    
    func configureCell(goal : Goal){
        self.goalDiscription.text = goal.goalDistription
        self.goalType.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalNumberToComplete{
            self.completeGoalView.isHidden = false
        }else {
            self.completeGoalView.isHidden = true
        }
    }
    
}
