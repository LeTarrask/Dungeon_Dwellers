//
//  JSONImporter.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 23/02/2024.
//

import Foundation
import CoreData

class CoreDataJSONImporter {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        loadLocalSRDData()
    }

    private func loadLocalSRDData() {
        guard let path = Bundle.main.path(forResource: "srd_5e_monsters", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            let monstersData = try JSONDecoder().decode([MonsterAdapter].self, from: data)

            for monsterData in monstersData {
                let monster = Monster(context: context)

                // Set the attributes of the Monster instance
                monster.name = monsterData.name
                monster.meta = monsterData.meta
                monster.armorClass = Int16(monsterData.armorClass) ?? 0
                monster.hitPoints = Int16(monsterData.hitPoints) ?? 0
                monster.speed = Int16(monsterData.speed) ?? 0
                monster.str = Int16(monsterData.str) ?? 0
                monster.str = Int16(extractInt(from: monsterData.strMod))
                monster.strMod = Int16(monsterData.strMod) ?? 0
                monster.dex = Int16(monsterData.dex) ?? 0
                monster.dexMod = Int16(extractInt(from: monsterData.dexMod))
                monster.con = Int16(monsterData.con) ?? 0
                monster.conMod = Int16(extractInt(from: monsterData.conMod))
                monster.int = Int16(monsterData.int) ?? 0
                monster.intMod = Int16(extractInt(from: monsterData.intMod))
                monster.wis = Int16(monsterData.wis) ?? 0
                monster.wisMod = Int16(extractInt(from: monsterData.wisMod))
                monster.cha = Int16(extractInt(from: monsterData.chaMod))
                monster.chaMod = Int16(monsterData.chaMod) ?? 0
                monster.savingThrows = monsterData.savingThrows
                monster.skills = monsterData.skills
                monster.senses = monsterData.senses
                monster.languages = monsterData.languages
                monster.challenge = monsterData.challenge
                monster.traits = monsterData.traits
                monster.actions = monsterData.actions
                monster.legendaryActions = monsterData.legendaryActions
                monster.imgURL = monsterData.imgURL

                // Save the context if needed
                do {
                    try context.save()
                } catch {
                    print("failed to save context")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    // Define a helper function to extract the integer from the string
    func extractInt(from string: String) -> Int {
        guard let regex = try? NSRegularExpression(pattern: "-?\\d+", options: []) else { return 0 }
        let range = NSRange(string.startIndex..., in: string)
        if let match = regex.firstMatch(in: string, options: [], range: range) {
            if let numberRange = Range(match.range, in: string) {
                if let intValue = Int(string[numberRange]) {
                    return intValue
                }
            }
        }
        return 0
    }
}
