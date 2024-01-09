//
//  MonsterListViewModel.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import Foundation

class MonsterListViewModel: ObservableObject {
    @Published var monsters: [Monster] = []
    @Published var searchText = ""
    @Published var searchByName: Bool = true

    var filteredMonsters: [Monster] {
        if searchText.isEmpty {
            return monsters
        } else {
            switch searchByName {
            case true:
                return monsters.filter { $0.name.lowercased().contains(searchText.lowercased())}
            case false:
                return monsters.filter {
                    ($0.traits?.lowercased().contains(searchText.lowercased()) ?? false) ||
                    ($0.actions?.lowercased().contains(searchText.lowercased()) ?? false) ||
                    ($0.legendaryActions?.lowercased().contains(searchText.lowercased()) ?? false)
                }
            }
        }
    }

    init() {
        loadLocalSRDData()
    }

    private func loadLocalSRDData() {
        guard let path = Bundle.main.path(forResource: "srd_5e_monsters", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            self.monsters = try JSONDecoder().decode([Monster].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
