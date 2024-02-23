//
//  MonsterTraitsAndActions.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MonsterTraitsAndActions: View {
    let monster: Monster

    var body: some View {
        if monster.traits != nil {
            Divider()
            MarkdownLabel(title: "TRAITS", markdown: monster.traits ?? "")
        }

        if monster.actions != nil {
            Divider()

            MarkdownLabel(title: "ACTIONS", markdown: monster.actions ?? "")
        }

        if monster.legendaryActions != nil {
            Divider()

            MarkdownLabel(title: "LEGENDARY ACTIONS", markdown: monster.legendaryActions ?? "")
        }

        Divider()
    }
}
