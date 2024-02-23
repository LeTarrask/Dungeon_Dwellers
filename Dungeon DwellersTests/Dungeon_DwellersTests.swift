//
//  Dungeon_DwellersTests.swift
//  Dungeon DwellersTests
//
//  Created by Alex Luna on 09/01/2024.
//

import XCTest
@testable import Dungeon_Dwellers
import CoreData

final class Dungeon_DwellersTests: XCTestCase {
    var context: NSManagedObjectContext?
    var viewModel: MonsterListViewModel?

    override func setUp() {
        super.setUp()
        context = PersistenceController.preview.container.viewContext

        // Delete all data from the context
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Monster")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? context?.execute(deleteRequest)

        // Loads data normally again
        _ = CoreDataJSONImporter(context: context!)
        viewModel = MonsterListViewModel()
    }

    override func tearDownWithError() throws {
        context = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    // A test case for testing if the viewmodel loads data properly
    func testLoadingMonstersArray() {
        viewModel?.loadMonsters(context: context!)

        // Assert that the monsters array contains 327 elements after loading the data
        XCTAssertEqual(viewModel?.monsters.count, 327)
    }

    // A test case for testing if the viewmodel filters data properly
    func testFilteringMonstersArray() {
        viewModel?.loadMonsters(context: context!)
        // Assert that the filteredMonsters array returns the same array as monsters when the searchText is empty
        XCTAssertEqual(viewModel?.filteredMonsters, viewModel?.monsters)

        // Set the searchText to "dragon"
        viewModel?.searchText = "dragon"

        // Assert that the filteredMonsters array returns a subset of monsters that match the searchText
        XCTAssertEqual(viewModel?.filteredMonsters.count, 43)

        // Using a guard statement
        guard let viewModel = viewModel else {
            return XCTFail("ViewModel is nil")
        }
        XCTAssertTrue(viewModel.filteredMonsters.allSatisfy { $0.name!.lowercased().contains("dragon") })
    }

    // A test case for testing if the viewmodel filters data properly, if the user types different cases
    func testFilteringDifferentlyTypedMonstersArray() {
        viewModel?.loadMonsters(context: context!)

        // Set the searchText to "goBlin"
        viewModel?.searchText = "goBlin"

        // In this case, if we get Hobgoblin and Goblin, we get bot lower and uppercased creatures
        // Using a guard statement
        guard let viewModel = viewModel else {
            return XCTFail("ViewModel is nil")
        }
        XCTAssertTrue(viewModel.filteredMonsters.allSatisfy { $0.name!.contains("oblin") })

        // Assert that the filteredMonsters array returns a subset of monsters that match the searchText
        XCTAssertEqual(viewModel.filteredMonsters.count, 2)
    }
}
