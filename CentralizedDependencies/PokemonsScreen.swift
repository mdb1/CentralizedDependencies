//
//  PokemonsScreen.swift
//  CentralizedDependencies
//
//  Created by Manu on 29/02/2024.
//

import SwiftUI

struct PokemonsScreen: View {
    @StateObject private var viewModel = PokemonsViewModel()
    private let dateViewModel = DateViewModel()

    var body: some View {
        VStack {
            Button("Fetch Pokemons") {
                Task {
                    await viewModel.fetchPokemons()
                }
            }
            if viewModel.isLoading {
                ProgressView()
            }

            if let error = viewModel.error {
                Text(error.localizedDescription)
                    .foregroundStyle(.red)
            }

            Text("Current Date: \(dateViewModel.currentFormattedDate())")
            List {
                ForEach(viewModel.pokemons, id: \.self) { pokemon in
                    Text(pokemon)
                }
            }

        }
        .padding()
    }
}

#Preview("Fetch Pokemons Successfully") {
    #if DEBUG
    Current.pokemonsAPI.fetchPokemons = { ["Charizard"] }
    Current.date = { .distantFuture }
    Current.locale = .init(identifier: "es-AR")
    Current.timeZone = .init(abbreviation: "GMT-3")!
    #endif

    return PokemonsScreen()
}

#Preview("Fetch Pokemons Error") {
    #if DEBUG
    Current.pokemonsAPI.fetchPokemons = { throw NSError(domain: "Something went wrong", code: 1) }
    Current.date = { .distantPast }
    #endif

    return PokemonsScreen()
}
