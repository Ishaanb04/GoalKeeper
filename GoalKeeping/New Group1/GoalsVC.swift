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
    
    var goals : [Goal] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    func fetchCoreDataObjects(){
        self.fetchData { (complete) in
            if complete {
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
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
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalsCell") as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addProgressAction = UITableViewRowAction(style: .normal, title: "ADD PROGRESS") { (rowAction, indexPath) in
            self.setProgressForGoal(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addProgressAction.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return [deleteAction, addProgressAction]
    }
}

extension GoalsVC{
    func setProgressForGoal( atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let currentGoal = goals[indexPath.row]
        if currentGoal.goalProgress < currentGoal.goalNumberToComplete {
            currentGoal.goalProgress += 1
        }else{
            return
        }
        do{
            try managedContext.save()
        }catch{
            debugPrint(error.localizedDescription)
        }
        
        
    }
    func removeGoal(atIndexPath indexPath : IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        
        do{
            try managedContext.save()
        }catch{
            debugPrint(error.localizedDescription)
        }
        tableView.reloadData()
    }
    func fetchData(completion : (_ complete : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        }catch{
            print(error)
            completion(false)
        }
    }
}


