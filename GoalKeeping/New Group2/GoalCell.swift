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
    
    func configureCell(discription : String , type : GoalType , goalProgressItem : Int){
        self.goalDiscription.text = discription
        self.goalType.text = type.rawValue
        self.goalProgress.text = String(describing: goalProgressItem)
        
    }
    
}
