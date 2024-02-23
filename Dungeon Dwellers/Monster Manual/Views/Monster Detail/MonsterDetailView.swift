//
//  MonsterDetailView.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import SwiftUI

struct MonsterDetailView: View {
    let monster: Monster

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MonsterHeader(monster: monster)

                MonsterCombatAndAttributes(monster: monster)

                MonsterTraitsAndActions(monster: monster)

                MonsterNotes(monster: monster)
            }
            .padding()
        }
    }
}
