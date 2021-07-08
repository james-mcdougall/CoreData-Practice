//
//  CreateTaskViewController.swift
//  Tasks
//
//  Created by Ben Gohlke on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    // MARK: - Properties
	var complete = false
	let circleChecked = UIImage(named: "checkmark.circle.fill")
	let circleUnchecked = UIImage(named: "circle")
    
    // MARK: - IBOutlets
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var notesTextView: UITextView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	//MARK: - Actions
	
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		navigationController?.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func save(_ sender: UIBarButtonItem) {
		guard let name = nameTextField.text, !name.isEmpty else { return }
		let notes = notesTextView.text
		let task = Task(name: name, notes: notes, complete: complete)
		do {
			try CoreDataStack.sharedCDS.mainContext.save()
			navigationController?.dismiss(animated: true, completion: nil)
		} catch {
			NSLog("Error saving managed object context: \(error)")
		}
	}
	
	@IBAction func toggleComplete(_ sender: UIButton) {
		complete.toggle()
		sender.setImage(complete ? circleChecked : circleUnchecked, for: .normal)
	}
}
