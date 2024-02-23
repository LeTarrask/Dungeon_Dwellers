//
//  MonsterViewModel.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import Foundation
import CoreData

class MonsterViewModel: ObservableObject {
    @Published var isFavorite: Bool

    @Published var  monster: Monster

    @Published var notes: String

    private var context: NSManagedObjectContext

    init(monster: Monster,
         context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.monster = monster
        self.context = context
        self.isFavorite = monster.isFavorite
        self.notes = monster.notes ?? ""
    }

    func toggleFavorite() {
        monster.isFavorite.toggle()
        isFavorite = monster.isFavorite
        // Save changes to Core Data context
        do {
            try context.save()
            print("trying to save context")
        } catch {
            print("Couldn't save context")
        }
    }

    func saveNote() {
        monster.notes = notes

        // Save changes to Core Data context
        do {
            try context.save()
            print("trying to save context")
        } catch {
            print("Couldn't save context")
        }
    }
}
