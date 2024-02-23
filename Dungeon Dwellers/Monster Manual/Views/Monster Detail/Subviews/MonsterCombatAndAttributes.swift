//
//  MonsterCombatAndAttributes.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import SwiftUI

struct MonsterCombatAndAttributes: View {
    let monster: Monster

    var body: some View {
        VStack(alignment: .leading) {
            Trait(title: "Armor Class ", description: monster.armorClass.description)

            Trait(title: "Hit Points ", description: monster.hitPoints.description)

            Trait(title: "Speed ", description: monster.speed.description)
        }

        Divider()

        HStack(alignment: .center) {
            Attribute(type: "STR", value: Int(monster.str), mod: Int(monster.strMod))

            Attribute(type: "DEX", value: Int(monster.dex), mod: Int(monster.dexMod))

            Attribute(type: "CON", value: Int(monster.con), mod: Int(monster.conMod))

            Attribute(type: "INT", value: Int(monster.int), mod: Int(monster.intMod))

            Attribute(type: "WIS", value: Int(monster.wis), mod: Int(monster.wisMod))

            Attribute(type: "CHA", value: Int(monster.cha), mod: Int(monster.chaMod))
        }

        Divider()

        VStack(alignment: .leading) {
            Trait(title: "Saving Throws ", description: monster.savingThrows ?? "")

            Trait(title: "Senses ", description: monster.senses ?? "")

            Trait(title: "Languages ", description: monster.languages ?? "")

            Trait(title: "Challenge ", description: monster.challenge ?? "")
        }
    }
}
