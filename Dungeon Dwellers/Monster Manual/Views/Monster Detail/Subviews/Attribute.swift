//
//  Attribute.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct Attribute: View {
    let type: String
    let value: Int
    let mod: Int

    var body: some View {
        VStack {
            Text(type).bold()
            Text("\(value.description) (\(mod.description))")
        }
    }
}
