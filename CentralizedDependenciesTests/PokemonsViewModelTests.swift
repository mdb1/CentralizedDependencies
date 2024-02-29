//
//  PokemonsViewModelTests.swift
//  CentralizedDependenciesTests
//
//  Created by Manu on 29/02/2024.
//

import XCTest
@testable import CentralizedDependencies

final class PokemonsViewModelTests: XCTestCase {

    func test_fetchPokemons() async {
        // Given
        let expectedPokemons = ["1", "2", "3"]
        // Mock the dependencies of the Current World
        Current.pokemonsAPI.fetchPokemons = {
            expectedPokemons
        }

        let pokemonsVM = PokemonsViewModel()
        XCTAssertTrue(pokemonsVM.pokemons.isEmpty)
        XCTAssertNil(pokemonsVM.error)

        // When
        await pokemonsVM.fetchPokemons()

        // Then
        XCTAssertEqual(pokemonsVM.pokemons, expectedPokemons)
    }

    func test_fetchPokemons_error() async {
        // Given
        let error = NSError(domain: "", code: 1)
        // Mock the dependencies of the Current World
        Current.pokemonsAPI.fetchPokemons = {
            throw error
        }

        let pokemonsVM = PokemonsViewModel()
        XCTAssertTrue(pokemonsVM.pokemons.isEmpty)
        XCTAssertNil(pokemonsVM.error)

        // When
        await pokemonsVM.fetchPokemons()

        // Then
        XCTAssertTrue(pokemonsVM.pokemons.isEmpty)
        XCTAssertEqual(pokemonsVM.error?.localizedDescription, error.localizedDescription)
    }

}
