//
//  PokemonView.swift
//  PokemonDemo
//
//  Created by Kant on 12/30/23.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: CGFloat = 140  // CGFloat로 변경

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                case .failure(_):
                    Image(systemName: "photo")
                        .frame(width: dimensions, height: dimensions)
                default:
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                }
            }
            .background(.thinMaterial)
            .clipShape(Circle())

            Text(pokemon.displayName)
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}



#Preview {
    PokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
