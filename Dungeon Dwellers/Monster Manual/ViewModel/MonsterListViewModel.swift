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

    var filteredMonsters: [Monster] {
        if searchText.isEmpty {
            return monsters
        } else {
            return monsters.filter { $0.name.lowercased().contains(searchText.lowercased())}
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
