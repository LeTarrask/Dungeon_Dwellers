//
//  Trait.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct Trait: View {
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title).bold()
            Text(description)
        }
    }
}
