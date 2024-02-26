//
//  MonsterListViewModel.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import CoreData
import SwiftUI

class MonsterListViewModel: ObservableObject {
    @Published var monsters: [Monster] = []
    @Published var searchText = ""
    @Published var searchByName: Bool = true
    @Published var filterByFavorite = false

    var filteredMonsters: [Monster] {
        guard !searchText.isEmpty else {
            return filterByFavorite ? monsters.filter { $0.isFavorite } : monsters
        }

        return monsters.filter { monster in
            let lowercasedSearchText = searchText.lowercased()

            let nameMatch: Bool
            if searchByName {
                guard let name = monster.name else {
                    return false
                }
                nameMatch =  name.lowercased().contains(lowercasedSearchText)
            } else {
                let traitsMatch = monster.traits?.lowercased().contains(lowercasedSearchText) ?? false
                let actionsMatch = monster.actions?.lowercased().contains(lowercasedSearchText) ?? false
                let legendaryActionsMatch = monster.legendaryActions?
                    .lowercased().contains(lowercasedSearchText) ?? false

                nameMatch =  traitsMatch || actionsMatch || legendaryActionsMatch
            }

            let favoriteMatch = filterByFavorite ? monster.isFavorite : true

            return nameMatch && favoriteMatch
        }
    }

    func loadMonsters(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Monster> = Monster.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Monster.name, ascending: true)]

        do {
            monsters = try context.fetch(request)
        } catch {
            print("Failed to fetch monsters: \(error)")
        }
    }
}
