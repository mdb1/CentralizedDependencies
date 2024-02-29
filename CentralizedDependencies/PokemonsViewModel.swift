//
//  PokemonsViewModel.swift
//  CentralizedDependencies
//
//  Created by Manu on 29/02/2024.
//

import Foundation

final class PokemonsViewModel: ObservableObject {
    @Published var pokemons: [String] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    func fetchPokemons() async {
        defer { isLoading = false }
        do {
            isLoading = true
            let pokemons = try await Current.pokemonsAPI.fetchPokemons()
            self.pokemons = pokemons
        } catch {
            self.error = error
        }
    }
}
