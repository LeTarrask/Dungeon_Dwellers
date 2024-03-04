//
//  MonsterListHeader.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MonsterListHeader: View {
    @ObservedObject var viewModel: MonsterListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("SRD Monsters: \(viewModel.monsters.count)")

            Toggle("Search by monster name:", isOn: $viewModel.searchByName)
                .toggleStyle(.switch)

            Toggle("Filter by favorite:", isOn: $viewModel.filterByFavorite)
                .toggleStyle(.switch)
        }.padding()
    }
}
