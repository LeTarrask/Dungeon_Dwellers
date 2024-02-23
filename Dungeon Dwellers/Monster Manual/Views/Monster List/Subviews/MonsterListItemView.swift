//
//  MonsterListItemView.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MonsterListItemView: View {
    @ObservedObject var viewModel: MonsterViewModel

    @ObservedObject var monster: Monster

    init(monster: Monster) {
        self.monster = monster
        self.viewModel = MonsterViewModel(monster: monster)
    }

    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleFavorite()
            }, label: {
                Image(systemName: viewModel.isFavorite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(viewModel.isFavorite ? .yellow : .gray)
            })
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing)

            VStack(alignment: .leading) {
                Text(viewModel.monster.name ?? "")
                    .font(.title3)
                    .fontWeight(.bold)
                Text(viewModel.monster.meta ?? "")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
    let monster = Monster(context: context)
    monster.name = "Aaboleth"
    monster.meta = "Large aberration"
    return MonsterListItemView(monster: monster)
}
