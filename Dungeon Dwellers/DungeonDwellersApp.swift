//
//  DungeonDwellersApp.swift
//  Dungeon Dwellers
//
//  Created by Alex Luna on 05/01/2024.
//

import SwiftUI
import CoreData
#if os(iOS)
import UIKit
#endif

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
#if os(iOS)
            if UIDevice.current.userInterfaceIdiom == .pad {
                MonsterSplitListView()
                    .environment(\.managedObjectContext, context)
            } else {
                MonsterListView()
                    .environment(\.managedObjectContext, context)
            }
#elseif os(macOS) || targetEnvironment(macCatalyst)
            MonsterSplitListView()
                .environment(\.managedObjectContext, context)
#endif
        }
    }
}
