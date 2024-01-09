//
//  Dungeon_DwellersTests.swift
//  Dungeon DwellersTests
//
//  Created by Alex Luna on 09/01/2024.
//

import XCTest
@testable import Dungeon_Dwellers

final class Dungeon_DwellersTests: XCTestCase {

    // A test case for testing if the viewmodel loads data properly
    func testLoadingMonstersArray() {
        let viewModel = MonsterListViewModel()

        // Assert that the monsters array contains 327 elements after loading the data
        XCTAssertEqual(viewModel.monsters.count, 327)
    }

    // A test case for testing if the viewmodel filters data properly
    func testFilteringMonstersArray() {
        let viewModel = MonsterListViewModel()
        // Assert that the filteredMonsters array returns the same array as monsters when the searchText is empty
        XCTAssertEqual(viewModel.filteredMonsters, viewModel.monsters)

        // Set the searchText to "dragon"
        viewModel.searchText = "dragon"

        // Assert that the filteredMonsters array returns a subset of monsters that match the searchText
        print(viewModel.filteredMonsters)
        XCTAssertEqual(viewModel.filteredMonsters.count, 43)
        XCTAssertTrue(viewModel.filteredMonsters.allSatisfy { $0.name.lowercased().contains("dragon") })
    }

    // A test case for testing if the viewmodel filters data properly, if the user types different cases
    func testFilteringDifferentlyTypedMonstersArray() {
        let viewModel = MonsterListViewModel()

        // Set the searchText to "goBlin"
        viewModel.searchText = "goBlin"

        // In this case, if we get Hobgoblin and Goblin, we get bot lower and uppercased creatures
        XCTAssertTrue(viewModel.filteredMonsters.allSatisfy { $0.name.contains("oblin") })

        // Assert that the filteredMonsters array returns a subset of monsters that match the searchText
        XCTAssertEqual(viewModel.filteredMonsters.count, 2)
    }
}
