//
//  CoreDataStack.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 5/3/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    static let sharedInstance = CoreDataStack()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrackHub") // empty string to handle the name of the
       // let container = "MVSU"
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
