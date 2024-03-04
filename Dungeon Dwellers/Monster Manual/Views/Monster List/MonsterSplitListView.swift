//
//  MonsterSplitListView.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 04/03/2024.
//

import SwiftUI

struct MonsterSplitListView: View {
    @StateObject var viewModel: MonsterListViewModel = MonsterListViewModel()
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationSplitView(sidebar: {
            MonsterListView()
                .frame(width: 250)
        }, detail: {
            Text("Select a Monster")
        })
        .onAppear {
            viewModel.loadMonsters(context: context)
        }
    }
}

#Preview {
    MonsterSplitListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
