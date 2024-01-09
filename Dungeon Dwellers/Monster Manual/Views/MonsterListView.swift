//
//  MonsterListView.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import SwiftUI

struct MonsterListView: View {
    @StateObject var viewModel = MonsterListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("SRD Monsters \(viewModel.monsters.count)")

                    Toggle("Search by monster trait", isOn: $viewModel.searchByName)
                        .toggleStyle(.switch)
                }.padding()

                List {
                    ForEach(viewModel.filteredMonsters, id: \.name) { monster in
                        NavigationLink(value: monster,
                                       label: {
                            VStack(alignment: .leading) {
                                Text(monster.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text(monster.meta)
                                    .font(.subheadline)
                            }
                        })
                    }
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Dungeon Dwellers 5e")
                .navigationDestination(for: Monster.self) { monster in
                    MonsterDetailView(monster: monster)
            }
            }
        }
    }
}

#Preview {
    MonsterListView()
}
