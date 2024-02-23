//
//  Header.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MonsterHeader: View {
    let monster: Monster

    var body: some View {
        VStack(alignment: .leading) {
            Text(monster.name ?? "").bold()
                .font(.title2)
            Text(monster.meta ?? "")
                .italic()
        }

        if let url = URL(string: monster.imgURL ?? "") {
            AsyncImage(url: url) { image in
                image.image?
                    .resizable()
                    .scaledToFit()
            }
        }

        Divider()
    }
}
