//
//  ViewController.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/25/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addGoalWasPressed(_ sender: UIButton) {
        tableView.isHidden = false
    }
    
}

