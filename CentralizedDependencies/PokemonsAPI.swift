//
//  PokemonsAPI.swift
//  CentralizedDependencies
//
//  Created by Manu on 29/02/2024.
//

import Foundation

struct PokemonsAPI {
    var fetchPokemons: () async throws -> [String] = {
        // Note: This should have the real code that hits the backend
        try await Task.sleep(for: .seconds(2))
        return ["Pikachu", "Charmander"]
    }
}
