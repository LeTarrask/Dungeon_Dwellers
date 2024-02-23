//
//  MonsterListView.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import SwiftUI
import CoreData

struct MonsterListView: View {
    @StateObject var viewModel: MonsterListViewModel = MonsterListViewModel()
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationStack {
            VStack {
                MonsterListHeader(viewModel: viewModel)

                List {
                    ForEach(viewModel.filteredMonsters, id: \.name) { monster in
                        NavigationLink(
                            destination: MonsterDetailView(monster: monster),
                            label: { MonsterListItemView(monster: monster) }
                        )
                    }
                }
                .listStyle(.plain)
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Dungeon Dwellers 5e")
            }
            .onAppear {
                viewModel.loadMonsters(context: context)
            }
        }
    }
}

#Preview {
    MonsterListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
