//
//  MarkdownLabel.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MarkdownLabel: View {
    let title: String
    let markdown: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(LocalizedStringKey(markdown))
        }
    }
}
