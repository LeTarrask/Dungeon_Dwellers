//
//  Monster.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import Foundation

// MARK: - Monster
struct Monster: Codable, Hashable {
    let name, meta, armorClass, hitPoints: String
    let speed, str, strMod, dex: String
    let dexMod, con, conMod, int: String
    let intMod, wis, wisMod, cha, chaMod: String
    let savingThrows, skills, senses: String?
    let languages, challenge, traits, actions: String?
    let legendaryActions: String?
    let imgURL: String?

    enum CodingKeys: String, CodingKey {
        case name, meta
        case armorClass = "Armor Class"
        case hitPoints = "Hit Points"
        case speed = "Speed"
        case str = "STR"
        case strMod = "STR_mod"
        case dex = "DEX"
        case dexMod = "DEX_mod"
        case con = "CON"
        case conMod = "CON_mod"
        case int = "INT"
        case intMod = "INT_mod"
        case wis = "WIS"
        case wisMod = "WIS_mod"
        case cha = "CHA"
        case chaMod = "CHA_mod"
        case savingThrows = "Saving Throws"
        case skills = "Skills"
        case senses = "Senses"
        case languages = "Languages"
        case challenge = "Challenge"
        case traits = "Traits"
        case actions = "Actions"
        case legendaryActions = "Legendary Actions"
        case imgURL = "img_url"
    }
}
