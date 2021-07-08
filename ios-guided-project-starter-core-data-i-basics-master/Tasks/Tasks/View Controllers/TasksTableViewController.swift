//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by Ben Gohlke on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {

    // MARK: - Properties
    
	var tasks: [Task] {
		let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
		let context = CoreDataStack.sharedCDS.mainContext
		do {
			return try context.fetch(fetchRequest)
		} catch {
			NSLog("Error fetching tasks: \(error)")
			return []
		}
	}
    
    // MARK: - IBOutlets
    
    
    // MARK: - View Lifecycle
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseIdentifier, for: indexPath) as? TaskTableViewCell else {
			fatalError("Can't deque cell of type \(TaskTableViewCell.reuseIdentifier)")
			return UITableViewCell()
			
		}
		cell.task = tasks[indexPath.row]
        // Configure the cell...

        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
