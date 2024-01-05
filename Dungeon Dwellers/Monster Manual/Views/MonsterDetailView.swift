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
                VStack(alignment: .leading) {
                    Text(monster.name).bold()
                        .font(.title3)
                    Text(monster.meta)
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

                VStack(alignment: .leading) {
                    Trait(title: "Armor Class ", description: monster.armorClass)

                    Trait(title: "Hit Points ", description: monster.hitPoints)

                    Trait(title: "Speed ", description: monster.speed)
                }

                Divider()

                HStack(alignment: .center) {
                    Attribute(type: "STR", value: monster.str, mod: monster.strMod)

                    Attribute(type: "DEX", value: monster.dex, mod: monster.dexMod)

                    Attribute(type: "CON", value: monster.con, mod: monster.conMod)

                    Attribute(type: "INT", value: monster.int, mod: monster.intMod)

                    Attribute(type: "WIS", value: monster.wis, mod: monster.wisMod)

                    Attribute(type: "CHA", value: monster.cha, mod: monster.chaMod)
                }

                Divider()

                VStack(alignment: .leading) {
                    Trait(title: "Saving Throws ", description: monster.savingThrows ?? "")

                    Trait(title: "Senses ", description: monster.senses ?? "")

                    Trait(title: "Languages ", description: monster.languages ?? "")

                    Trait(title: "Challenge ", description: monster.challenge ?? "")
                }

                Divider()

                // TODO: maybe convert this html to md?
                Text(monster.traits ?? "")

                Divider()

                Text("ACTIONS")

                Text(monster.actions ?? "")

                Text("LEGENDARY ACTIONS")

                Text(monster.legendaryActions ?? "")
            }
            .padding()
        }
    }
}

struct Trait: View {
    let title: String
    let description: String

    var body: some View {
        HStack {
            Text(title).bold()
            Text(description)
        }
    }
}

struct Attribute: View {
    let type: String
    let value: String
    let mod: String

    var body: some View {
        VStack {
            Text(type).bold()
            Text(value + " " + mod)
        }
    }
}

#Preview {
    let model = MonsterListViewModel()
    return MonsterDetailView(monster: model.monsters.first!)
}
