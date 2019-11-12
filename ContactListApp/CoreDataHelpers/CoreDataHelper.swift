//
//  CoreDataHelper.swift
//  ContactListApp
//
//  Created by Midhet Sulemani on 13/04/17.
//  Copyright © 2017 Midhet Sulemani. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    //Connecting the database
    let stack = CoreDataStack(modelName: "ContactModel")!
    var context:NSManagedObjectContext
    
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>? {
        didSet {
            executeSearch()
        }
    }
    
    init() {
        context = stack.context
    }
    
    func executeSearch() {
        if let fc = fetchedResultsController {
            do {
                try fc.performFetch()
            } catch let e as NSError {
                print("Error while trying to perform a search: \n\(e)\n\(String(describing: fetchedResultsController))")
            }
        }
    }
}
