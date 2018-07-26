//
//  ViewController.swift
//  GoalKeeping
//
//  Created by Ishaan Bhasin on 7/25/18.
//  Copyright © 2018 Ishaan Bhasin. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addGoalWasPressed(_ sender: UIButton) {
        tableView.isHidden = false
        guard let createGoalsVC = storyboard?.instantiateViewController(withIdentifier: "GoalsInputVC") else { return }
        presentDetail(createGoalsVC)
    }
    
}
extension GoalsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalsCell") as? GoalCell else { return UITableViewCell() }
        cell.configureCell(discription: "Eat salad twice a week.", type: .longTermGoal , goalProgressItem: 2)
        return cell
    }
}



