//
//  MonsterNotes.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MonsterNotes: View {
    @ObservedObject var viewModel: MonsterViewModel

    let monster: Monster

    init(monster: Monster) {
        self.monster = monster
        self.viewModel = MonsterViewModel(monster: monster)
    }

    var body: some View {
        Text("NOTES")
            .font(.headline)

        TextEditor(text: $viewModel.notes)
            .padding()
            .background(.yellow.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .textEditorStyle(.plain)
            .frame(height: 150)

        HStack {
            Spacer()

            Button("Save",
                   action: viewModel.saveNote)
            .buttonStyle(.borderedProminent)
        }
    }
}
