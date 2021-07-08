//
//  CoreDataStack.swift
//  Tasks
//
//  Created by James McDougall on 7/8/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
	
	static let sharedCDS = CoreDataStack()
	
	lazy var container: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "Tasks")
		container.loadPersistentStores { _, error in
			if let error = error {
				fatalError("Failed to load persistent stores: \(error)")
			}
		}
		return container
	}()
	
	var mainContext: NSManagedObjectContext {
		return container.viewContext
	}
}
