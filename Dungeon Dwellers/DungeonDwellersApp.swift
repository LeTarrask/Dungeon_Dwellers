//
//  DungeonDwellersApp.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import SwiftUI
import CoreData

@main
struct DungeonDwellersApp: App {
    @AppStorage("isFirstLoad") var isFirstLoad: Bool = true

    private let context: NSManagedObjectContext

    init() {
        context = PersistenceController.shared.container.viewContext

        if isFirstLoad {
            _ = CoreDataJSONImporter(context: context)
            isFirstLoad = false
        }
    }

    var body: some Scene {
        WindowGroup {
            MonsterListView()
                .environment(\.managedObjectContext, context)
        }
    }
}
