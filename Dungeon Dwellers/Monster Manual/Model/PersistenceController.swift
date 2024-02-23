//
//  PersistenceController.swift
//  FinalPhoto
//
//  Created by Alex Luna on 25/07/2023.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create preview data here
        //        FakeDataGenerator.createSampleDataIfNeeded()
        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Monster")
        if inMemory {
            container.persistentStoreDescriptions.first?.url =
            URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            } else {
                print("Loaded store \(description)")
            }
        }

        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            print("Document Directory: \(documentDirectory)")
        }
    }

    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Couldn't save Core Data context")
            }
        }
    }
}
