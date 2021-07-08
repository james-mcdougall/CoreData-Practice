//
//  Task + Convenience.swift
//  Tasks
//
//  Created by James McDougall on 7/8/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Task {
	
	@discardableResult convenience init(identifier: UUID = UUID(),
		 name: String,
		 notes: String? = nil,
		 complete: Bool = false,
		 context: NSManagedObjectContext = CoreDataStack.sharedCDS.mainContext) {
		
		self.init(context: context)
		self.identifier = identifier
		self.name = name
		self.notes = notes
		self.complete = complete
	}
}
